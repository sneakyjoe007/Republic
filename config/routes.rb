Rails.application.routes.draw do
#root page is organization is already logged in
  devise_scope :organization do
    authenticated :organization do
      root 'organizations#profile', as: :authenticated_org
    end
  end

  devise_scope :user do
    authenticated :user do
      root 'users#profile', as: :authenticated_root #root page for user already logged in
    end

    unauthenticated :user do
      root 'devise/sessions#new', as: :unauthenticated_root #root page for new user not logged in (landing page)
    end
  end

  resources :categories
  resources :event_images

  devise_for :organizations
  devise_for :users

  resources :volunteers


  resources :events do
    resources :volunteers, only: [:new, :create]
  end

  get 'organizations/profile' => "organizations#profile" 
  
  resources :organizations do
   get :guideStar, on: :collection
  end

  get 'pages/about'
  get 'pages/contact'
  get 'users/events'
  get 'users/friends'
  get 'users/search'
  get 'event' => "events#show"

  get 'profile' => "users#profile"
  get 'admin' => 'admin#index', :as => :admin

  scope "/admin" do
    get 'dashboard' => 'admin#index', :as => :admin_dashboard
    get 'categories' => 'admin#categories'
  end


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
