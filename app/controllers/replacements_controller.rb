require 'digest/md5'
class ReplacementsController < ApplicationController
  def search

    catalog_number = CommonModule::normalize_catalog_number(params[:catalog_number])

    if params[:manufacturer].present? && params[:manufacturer].size >= 1
      manufacturer = ManufacturerSynonym.where(:title => params[:manufacturer])
      if manufacturer.size > 0
        manufacturer = manufacturer.first.manufacturer.title
      else
        raise "Такой производитель отсутствует"
      end
    end

    md5 = Digest::MD5.hexdigest(catalog_number)[0,2]
    @query = "SELECT * FROM price_catalog_#{md5} WHERE catalog_number = " + Price.connection.quote(catalog_number)
    if manufacturer.present?
      @query << " AND manufacturer = " + Price.connection.quote(manufacturer)
    end

    render :text => build_xml
  end

  def build_xml

    @client = ActiveRecord::Base.connection.instance_variable_get :@connection
    result = @client.query(@query, :as => :hash)
    xml = Builder::XmlMarkup.new(:indent=>2)
    respond_to do |format|
      format.html {
        xml.instruct!
        xml.replacements do
          result.each do |row|
            xml.replacement do
              xml.catalog_number row["catalog_number"]
              xml.new_catalog_number row["new_catalog_number"]
              xml.weight_grams row["weight_grams"]
              xml.manufacturer row["manufacturer"]
              for i in 0...AppConfig.max_replacements do
                if row["r#{i}"].present?
                  eval "xml.r#{i} row['r#{i}']"
                  eval "xml.rm#{i} row['rm#{i}']"
                end
              end
            end
          end
        end
      }
      xml
  end

    #render :text => result

  end
end
