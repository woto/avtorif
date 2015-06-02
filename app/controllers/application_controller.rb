class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate

  protected

  def authenticate
    unless (params[:controller] == 'prices' && params[:action] == 'search') || (params[:controller] == 'price_settings' && params[:action] == 'download')
      authenticate_or_request_with_http_basic do |username, password|
        username == "woto" && password == "woto"
      end
    end
  end

end
