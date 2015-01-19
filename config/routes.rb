Rails.application.routes.draw do

  resources :products
  get 'products/:id/delete' => 'products#delete', :as => :products_delete
  post 'products/:id/add_to_cart' => 'products#add_to_cart', :as => :products_add_to_cart

  resources :categories
  get 'categories/:id/delete' => 'categories#delete', :as => :categories_delete

  devise_for :users

  resources :orders
  post 'orders/:id/edit_details' => 'orders#edit_details', :as => :order_edit_details
  post 'orders/:id/checkout' => 'orders#checkout', :as => :order_checkout
  post 'orders/:id/cancel' => 'orders#cancel', :as => :order_cancel
  
  resources :line_items
  post 'line_items/update' => 'line_items#update'
  post 'line_items/:id/delete' => 'line_items#delete', :as => :line_items_delete

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
  #   resources :photos, concerns: :toggleableO

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
  get 'pages/home'
  get 'pages/pages_calculator'
  get 'pages/render_demo'
  root 'pages#home'

end
