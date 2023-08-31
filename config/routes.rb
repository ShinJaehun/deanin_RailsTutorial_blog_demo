Rails.application.routes.draw do
  # admin 페이지에 대한 접근 권한을 admin_controller.rb에서 할 수도 있지만
  # 이렇게도 할 수 있지!
  authenticated :user, ->(user) { user.admin? } do
    get 'admin', to: 'admin#index'
    get 'admin/posts'
    get 'admin/comments'
    get 'admin/users'
    get 'admin/show_post/:id', to: "admin#show_post", as: 'admin_post'
    # /admin/post/:id
  end

  get 'search', to: 'search#index'
  get 'users/profile'
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }

  get '/u/:id', to: 'users#profile', as: 'user'

  #resources :posts
  # /posts/1/comments/4
  resources :posts do
    resources :comments
  end

  get 'about', to: 'pages#about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
end
