Avtorif::Application.routes.draw do
  
  match 'uri_decoder' => "uri_decoder#index" 

  resources :discount_groups do
    resources :discount_rules
  end

  devise_for :users
  resources :filter_jobs
  resources :delivery_types
  resources :currencies
  resources :column_relations
  resources :import_jobs
  resources :replace_jobs
  resources :http_receives
  resources :check_receives
  resources :ftp_receives
  resources :autos
  resources :goods_auto_options
  resources :auto_options
  resources :periods
  resources :transmissions
  resources :gears
  resources :fuels
  resources :mies
  resources :repeats
  resources :repeats_jobs
  resources :crawler_receives do
    member do
      get 'start'
    end
  end
  match '/start_all_jobs/' => 'jobs#start_all', :as => :start_all_jobs
  match '/display_jobs/' => 'jobs#display_jobs', :as => :display_jobs
  resources :delayed_jobs do
    get 'clean', :on => :collection
    get 'renice', :on => :member
    get 'unlock', :on => :member
  end
  resources :suppliers do
    resources :supplier_prices do
      collection do
        delete :destroy_by_supplier
      end
    end

    resources :jobs do
      member do
        get 'start'
        get 'clean'
      end
      collection do
        get 'start_all'
        get 'start_by_supplier'
      end
      
      resources :supplier_prices
      resources :import_jobs
      resources :replace_jobs
      resources :receive_jobs
      resources :filter_jobs
      resources :unpack_jobs
      resources :convert_jobs
      resources :email_receives
      resources :folder_receives
      resources :ftp_receives
      resources :smb_receives
      resources :http_receives
      resources :crawler_receives
    end
  end

  resources :email_receives
  resources :folder_receives
  resources :ftp_receives
  resources :smb_receives
  resources :receive_jobs
  resources :filter_jobs
  resources :unpack_jobs
  resources :convert_jobs
  resources :analogues
  resources :goods
  resources :manufacturers do
   collection do
     post 'edit_multiply'
     put 'update_multiply'
   end
    resources :manufacturer_synonyms
  end
  resources :supplier_prices
  resources :prices do
    collection do
      get :search
    end
  end

  match '/:controller(/:action(/:id))'
  root :to => 'suppliers#index'
end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
