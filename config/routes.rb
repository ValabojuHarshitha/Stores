Stores::Application.routes.draw do
  match "vendor/index"=>"vendor#index"
  match "user/index" => "user#index"
  match "customer/index" => "customer#index"
  match "customer/listing" => "customer#listing"
  match "customer/store_listing" => "customer#store_listing"
  match "customer/listing_items" => "customer#listing_items"
  match "customer/user_store_list" => "customer#user_store_list"
  match "customer/store_category_list" => "customer#store_category_list"
  match "customer/item_list" => "customer#item_list"
  match "customer/right_item_list" => "customer#right_item_list"
  match "customer/fav_list" => "customer#fav_list"
  match "customer/quantity" => "customer#quantity"
  match "customer/buy" => "customer#buy"
  match "customer/my_list" => "customer#my_list"
  match "customer/test_haml" => "customer#test_haml"
  match "customer/removed_list" => "customer#removed_list"

  match "home/index"=>"home#index"
  match "home/show_stores" => "home#show_stores"
  match "home/save_stores" => "home#save_stores"
  match "home/select_items" => "home#select_items"
  match "home/googlemaps" => "home#googlemaps"
  match "home/city" => "home#city"
  match "user/index" => "user#index"


  devise_for :users

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
   root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
