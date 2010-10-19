ActionController::Routing::Routes.draw do |map|
  map.resources :autos

  map.resources :goods_auto_options

  map.resources :auto_options

  map.resources :periods

  map.resources :transmissions

  map.resources :gears

  map.resources :fuels

  map.resources :mies


  map.resources :repeats
  map.resources :repeats_jobs


  map.resources :suppliers do |sup|
    sup.resources :jobs
  end

  map.resources :jobs, :member => {:start => :get} do |job|
    job.resources :import_jobs
    job.resources :receive_jobs

    job.resources :email_receives
    job.resources :folder_receives
    job.resources :ftp_receives
    job.resources :smb_receives

  end

  map.resources :email_receives
  map.resources :folder_receives
  map.resources :ftp_receives
  map.resources :smb_receives

  map.resources :import_jobs
  map.resources :receive_jobs  

  map.resources :analogues
  map.resources :goods
  map.resources :manufacturers
  map.resources :attachments
  map.resources :prices, :collection => {:search => :get}  

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
