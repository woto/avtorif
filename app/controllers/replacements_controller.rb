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

  private

  def make_block(xml, i, replacement_result, &block)
    eval "xml.r#{i} do block.call(xml, i, replacement_result); end"
  end

  def build_xml

    @client = ActiveRecord::Base.connection.instance_variable_get :@connection
    result = @client.query(@query, :as => :hash)
    xml = Builder::XmlMarkup.new(:indent => 2)
    respond_to do |format|
      format.html {
        xml.instruct!
        xml.replacements do
          result.each do |row|
            xml.replacement do
              xml.catalog_number row["catalog_number"]
              xml.new_catalog_number row["new_catalog_number"]
              xml.title row["title"]
              xml.title_en row["title_en"]
              xml.weight_grams row["weight_grams"]
              xml.manufacturer row["manufacturer"]
              for i in 0...AppConfig.max_replacements do
                if row["r#{i}"].present?
                  md5 = Digest::MD5.hexdigest(row["r#{i}"])[0, 2]
                  manufacturer = row["rm#{i}"]
                  query = "SELECT * from price_catalog_#{md5} where catalog_number = '" + row["r#{i}"] + "'"
                  if manufacturer.present?
                    manufacturer_condition = " AND manufacturer = '" + row["rm#{i}"] + "'"
                  else
                    manufacturer_condition = " AND manufacturer IS NULL"
                  end
                  query << manufacturer_condition
                  replacement_result = @client.query(query)
                  make_block(xml, i, replacement_result.first) do |z1, z2, z3|
                    z1.catalog_number z3['catalog_number']
                    z1.manufacturer z3['manufacturer']
                    z1.title z3['title']
                    z1.title_en z3['title_en']
                    z1.weight_grams z3['weight_grams']
                    z1.new_catalog_number z3['new_catalog_number']
                  end
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
