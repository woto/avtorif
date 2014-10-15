class SpareCatalogsController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def create
    catalog_number = CommonModule::normalize_catalog_number(CommonModule::convert_all_cyr_to_lat(params[:catalog_number]))
    manufacturer = CommonModule::find_manufacturer_synonym(params[:manufacturer], -1, false)[1..-2]
    md5 = Digest::MD5.hexdigest(catalog_number)[0,2]
    name = params[:name]

    query = "SELECT * from price_catalog_#{md5} WHERE catalog_number = #{Price.connection.quote(catalog_number)} AND manufacturer = #{Price.connection.quote(manufacturer)}"

    result = ActiveRecord::Base.connection.select_all(query)

    if result.any?
      query = "UPDATE price_catalog_#{md5} SET image_url = #{Price.connection.quote(name)} WHERE catalog_number = #{Price.connection.quote(catalog_number)} AND manufacturer = #{Price.connection.quote(manufacturer)}"
    else
      query = "INSERT INTO price_catalog_#{md5} (catalog_number, manufacturer, image_url) VALUES (#{Price.connection.quote(catalog_number)}, #{Price.connection.quote(manufacturer)}, #{Price.connection.quote(name)})"
    end

    Price.connection.execute(query)

    render :text => 'ok'
    #render :nothing => true
  end

end
