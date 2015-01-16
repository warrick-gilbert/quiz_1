Rails.application.routes.draw do

# this sends the user to the create a supoort request page
get "/new" => "support_requests#new"

# if the user goes here, or is redirected here, go to the index page
get "/support_requests" => "welcome#index", as: :support_requests

# when the user hits submit, the support request should be posted to:
post "/support_requests" => "support_requests#create"

# location to go to, to toggle the "done" status
get "support_requests/toggle_done" => "support_requests#toggle_done", as: :toggle_done_support_request

# if the user wants to edit their request they go here
get "/support_requests/:id/edit" => "support_requests#edit", as: :edit_support_request

# if the user wants to go to their request they go here
get "/support_requests/:id" => "support_requests#show", as: :support_request

# if the user hits update (and the db is successfully updated)
patch "/support_requests/:id" => "support_requests#update"

# if the user wants to delete their request, they go to
delete "/support_requests/:id" => "support_requests#destroy"


 root "welcome#index"
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
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
