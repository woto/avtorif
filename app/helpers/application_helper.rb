# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def pages
    controllers = Dir.new("#{Rails.root}/app/controllers").entries.sort
    cont = Array.[]
    controllers.reject! { |controller| 
      controller =~ /^(\.|\.\.|application|job|check_receives|repeats|supplier_prices|discount_groups|discount_rules|unpack_jobs|suppliers|import_jobs|convert_jobs|ftp_receives|smb_receives|http_receives|receive_jobs|folder_receives|filter_jobs|email_receives|manufacturers|manufacturer_synonyms|delayed_jobs|currencies|crawler_receives|periods|prices|replacements|uri_decoder|column_relations|replace_jobs|transmissions|goods|mies|auto_options|gears|fuels|autos|analogues|delivery_types|price_settings|optimal_product).*/
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

  def job_path
    supplier_id = params[:supplier_id]
    job_id = params[:job_id] || params[:id]
    supplier = Supplier.find(supplier_id)
    @content = raw("<br /><br /><h1>")
    @content = content_tag(:span, link_to(supplier.title, supplier_jobs_path(supplier)) + " ")
    if job_id
      recursive_build_job_path(job_id)
    end
    @content << raw("</h1><br /><br />")
  end

  private
    def recursive_build_job_path(job_id)
      job = Job.find(job_id)
      if job.job_id.present?
        recursive_build_job_path(job.job_id)
      end
      @content << content_tag(:span, link_to(job.title, supplier_job_path(job.supplier, job))  + " ")
    end
  
end
