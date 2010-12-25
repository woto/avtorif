class UriDecoderController < ApplicationController
  def index
    if params[:uri_decoder]
      @decoded_string = URI::decode(params[:uri_decoder][:uri])
    end
  end
end
