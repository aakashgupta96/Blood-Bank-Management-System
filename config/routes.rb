Rails.application.routes.draw do
  
  resources :orders
  resources :bloods ,except: [:index, :destroy]

  devise_for :donors, controllers: {registrations: "donors/registrations", sessions: "donors/sessions", confirmations: "donors/confirmations", passwords: "donors/passwords"}
  devise_for :banks, controllers: {registrations: "banks/registrations", sessions: "banks/sessions", confirmations: "banks/confirmations", passwords: "banks/passwords"}
  devise_for :hospitals, controllers: {registrations: "hospitals/registrations", sessions: "hospitals/sessions", confirmations: "hospitals/confirmations", passwords: "hospitals/passwords"}
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'general#home'
  get  "/donor/dashboard" => "general#donor_dashboard" , as: "donor_dashboard"
  get  "/bank/dashboard" => "general#bank_dashboard" , as: "bank_dashboard"
  get "/bank/requests" => "general#requests", as: "requests"
  get  "/hospital/dashboard" => "general#hospital_dashboard" , as: "hospital_dashboard"
  post "/bank/accept_request/:request_id" => "general#accept_request", as: "accept_request"
  post "/bank/reject_request/:request_id" => "general#reject_request", as: "reject_request" 
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
