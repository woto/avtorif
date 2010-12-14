# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def pages
    controllers = Dir.new("#{Rails.root}/app/controllers").entries.sort
    cont = Array.[]
    controllers.reject! { |controller| 
      controller =~ /^(\.|\.\.|application|job|check_receives|repeats|supplier_prices|discount_groups|discount_rules|unpack_jobs|suppliers|import_jobs|convert_jobs|ftp_receives|smb_receives|http_receives|receive_jobs|folder_receives|filter_jobs|email_receives).*/
    }
#      controllers.each_with_index do |controller, i|
#     if controller =~ /_controller/ &&
#             !(controller =~ /application/) &&
#             !(controller =~ /job/) &&
#             !(controller =~ /check_receives/) &&
#             !(controller =~ /repeats/) &&
#             !(controller =~ /supplier_prices/) &&
#             !(controller =~ /discount_groups/) &&
#             !(controller =~ /discount_rules/)
    controllers.each do |controller|
        cont << link_to(controller.camelize.gsub("Controller.rb",""), {:controller => controller.camelize.gsub("Controller.rb","").tableize})
    end

    return cont
  end

end
