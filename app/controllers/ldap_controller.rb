require 'rubygems'
require 'net/ldap'
require 'ruby-debug'
require 'active_support/builder' unless defined?(Builder)


class LdapController < ApplicationController

  def index
    ldap = Net::LDAP.new :host => "192.168.1.1",
      :port => 389,
      :auth => {
      :method => :simple,
      :username => "cn=inetuser,cn=Users,dc=avtorif,dc=local",
      :password => "Hrf5k4adk5+"
    }

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

    headers = [:name, :title, :mail, :telephonenumber, :mobile, :othermobile, :initials]
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

    xm.table {
      xm.tr do
        headers.each do |header|
          xm.td(header.to_s)
        end
      end


      sorted_entries_block.each do |key, entries|
        entries.each do |entry|
          if((entry[:useraccountcontrol].any? {|item| item != "66050" } || entry[:useraccountcontrol].blank?) && !entry[:objectclass].any? {|item| item == "group"})
            #puts "DN: #{entry.dn}"
            
            xm.tr do
              if entry[:useraccountcontrol].empty?
                color = "yellow"
              else
                color = ActionController::Base.helpers.cycle("#dde", "#eed")
              end

              headers.each do |header|
                #if [:name].include? attribute
                  #result << "   #{attribute}:"
                  result = String.new
                  entry[header.to_sym].each do |value|
                    result << "#{value} "
                  end 
                  xm.td(result, :style=> "background: #{color}")
                #end 
              end
            end
          end
        end
      end
    }

    #p ldap.get_operation_result
    render :text => xm, :layout => true
  end

end
