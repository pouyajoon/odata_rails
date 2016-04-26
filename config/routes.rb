Rails.application.routes.draw do 
  ActiveAdmin.routes(self)
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

 # map.with_options(:controller => "o_data") do |o_data|
 #    o_data.o_data_service  "/OData/OData.svc",                                     :action => "service"
 #    o_data.o_data_metadata "/OData/OData.svc/$metadata",                           :action => "metadata"
 #    o_data.o_data_resource "/OData/OData.svc/*#{ODataController.path_param.to_s}", :action => "resource"
    
 #    o_data.connect "/OData",                                     :action => "redirect_to_service"
 #    o_data.connect "/OData/$metadata",                           :action => "redirect_to_metadata"
 #    o_data.connect "/OData/*#{ODataController.path_param.to_s}", :action => "redirect_to_resource"
 #  end

  root 'odata#home'

  get 'metadata' => 'odata#metadata'
  get 'Cities' => 'odata#cities'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
