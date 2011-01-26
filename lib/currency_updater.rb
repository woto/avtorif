class CurrencyUpdater
  def update
    client = Savon::Client.new do |wsdl, http|
       #wsdl.document = "http://ws.emex.ru/EmExService.asmx?WSDL"
       #wsdl.document = "http://62.5.214.110/partnersws/Service.asmx?WSDL"
       wsdl.document = "http://192.168.1.42/trade_dda/ws/currencies.1cws?wsdl"
       http.auth.basic "webservice","webservice"
       #wsdl.endpoint = "http://192.168.1.42/trade_dda/ws/currencies.1cws"
    end

    debugger

    #Savon.soap_version = 2

       #client.wsdl.namespace = "sssssssssss"
    #puts '1'

    #p client.wsdl.soap_actions

    # wsdl2ruby.rb --wsdl http://webservice:webservice@192.168.1.42/trade_dda/ws/currencies.1cws?wsdl --type client
    
    client.request :wsdl, :add_currency_rate do |r|
      debugger
      r.body = {"currency_code" => 'ooo', "currencyName" => 'ooo', "rate" => '7.0'} 
    end

    debugger
    result = client.request :wsdl, :get_currency_list do |n|
    end

    p result

    #response = client.request :get_version_date do
    #  soap.body = { :currency_code => 'a', :currency_name => 'z', :rate => '1' }
    #end

  end
end
