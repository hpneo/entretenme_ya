Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users

  #Redirige peticion SHOW a controlador PROFILE
  get '/profile/show/:id' => 'profile#show'
  #Redirige peticion EDIT a controlador PROFILE
  get '/profile/edit/:id' => 'profile#edit'
  #Redirige peticion UPDATE a controlador PROFILE
  post '/profile/update' => 'profile#update'

  
  resources :contents do
    collection do
      get :search
    end
  end

  get '/:content_type/search' => 'contents#search'

  #Redirige peticion NEW a controlador COMMENT
  get '/comment/new/:content_id' => 'comment#new'
  #Redirige peticion CREATE a controlador COMMENT
  post '/comment/create' => 'comment#create'
  #Redirige peticion LIST a controlador COMMENT
  get '/comment/list' => 'comment#list'
  #Redirige peticion CREATE a controlador FAVORITE
  get '/favorite/create' => 'favorite#create'
  #Redirige peticion CREATE a controlador PENDING
  get '/pending/create' => 'pending#create'
  #Redirige peticion NEW a controlador REVIEW
  get '/review/new/:content_id' => 'review#new'
  #Redirige peticion CREATE a controlador REVIEW
  post '/review/create' => 'review#create'


  root 'home#index'
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
