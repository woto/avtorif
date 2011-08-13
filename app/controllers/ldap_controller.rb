require 'net/ldap'

class LdapController < ApplicationController

  def index
    ldap = Net::LDAP.new AppConfig.ldap.deep_symbolize_keys

    filter = Net::LDAP::Filter.eq("cn", "*")
    treebase = "ou=Avtorif,dc=avtorif,dc=local"

    entries_block = {}
    headers = []
    ldap.search(:base => treebase, :filter => filter) do |entry|
      value = entry[:dn].to_s.slice(/,(.*)/, 1)

      result = ''
      if value.respond_to? 'to_s'
        result = value.to_s
      else
        result = ''
      end

      if entries_block[result].nil?
        entries_block[result] = []
      end

      entries_block[result] << entry

      headers = headers + entry.attribute_names
      headers.uniq!
    end

    #headers = headers - [:badpasswordtime, :whenchanged, :givenname, :lastlogoff, :accountexpires, :objectguid, :initials, :lastlogon, :objectsid,
    #  :mstsexpiredate, :info, :pager, :facsimiletelephonenumber, :postalcode, :userparameters, :co, :lockouttime, :c, :description, 
    #  :physicaldeliveryofficename, :member, :st, :pwdlastset, :"msds-supportedencryptiontypes", :admincount, :managedobjects, :usnchanged, 
    #  :company, :streetaddress, :whencreated, :logoncount, :grouptype, :homephone, :l, :countrycode, :mstslicenseversion, :mstsmanagingls, 
    #  :directreports, :manager, :ipphone, :department, :dscorepropagationdata, :lastlogontimestamp, :badpwdcount, :memberof, :codepage, :objectcategory, 
    #  :instancetype, :distinguishedname, :samaccounttype, :cn, :sn, :dn, :usncreated, :useraccountcontrol, :primarygroupid, :userprincipalname, 
    #  :objectclass, :samaccountname, :displayname, :postofficebox]

    headers = [:name, :title]

    xm = Builder::XmlMarkup.new

    entries_block.each do |key, entries|
      entries.sort!{|a,b| a[:useraccountcontrol] <=> b[:useraccountcontrol]}
    end

    sorted_entries_block = entries_block.sort do |a,b| 
      if a[1][0][:initials].blank? && b[1][0][:initials].blank?
        -1
      elsif a[1][0][:initials].blank?
        1
      elsif b[1][0][:initials].blank?
        -1
      else
        a[1][0][:initials] <=> b[1][0][:initials]
      end
    end

    xm.table(:style => "width: 100%") {
      sorted_entries_block.each do |key, entries|
        #xm.tr do
        #  headers.each do |header|
        #    xm.td(header.to_s)
        #  end
        #end


        entries.each do |entry|
          if((entry[:useraccountcontrol].any? {|item| item != "66050" } || entry[:useraccountcontrol].blank?) && !entry[:objectclass].any? {|item| item == "group"})
            #puts "DN: #{entry.dn}"
            
            xm.tr do
              if entry[:useraccountcontrol].empty?
                style = "background: white; text-align: left"
              ActionController::Base.helpers.reset_cycle

              else
                style = ActionController::Base.helpers.cycle("background: #FED", "background: #FDD")
              end

              headers.each do |header|
                #if [:name].include? attribute
                  #result << "   #{attribute}:"
                  result = String.new
                  entry[header.to_sym].each do |value|
                    result << "#{value} "
                  end 
                  if entry[:useraccountcontrol].empty?
                    xm.th(result, :style=> "#{style}")
                  else
                    xm.td(result, :style=> "#{style}")
                  end
                #end 
              end
              xm.td(:style => "#{style}"){|value| value << "<a href='mailto:#{entry[:mail]}'>#{entry[:mail]}</a>"}
              xm.td(:style => "#{style}"){|value| value << [entry[:telephonenumber], entry[:mobile], entry[:othermobile]].join('<br>')}
            end
          end
        end
      end
    }

    #p ldap.get_operation_result
    render :text => xm, :layout => 'avtorif'
  end

end
