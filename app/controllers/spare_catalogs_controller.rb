class SpareCatalogsController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def create
    catalog_number = CommonModule::normalize_catalog_number(CommonModule::convert_all_cyr_to_lat(params[:catalog_number]))
    manufacturer = CommonModule::find_manufacturer_synonym(params[:manufacturer], -1, false)[1..-2]
    md5 = Digest::MD5.hexdigest(catalog_number)[0,2]

    query = "SELECT * from price_catalog_#{md5} WHERE catalog_number = #{Price.connection.quote(catalog_number)} AND manufacturer = #{Price.connection.quote(manufacturer)}"

    result = ActiveRecord::Base.connection.select_all(query)

    result.each do |row|
      puts row
    end

    render :nothing => true
  end

end
