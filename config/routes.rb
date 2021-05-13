Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  
  get 'post', to: 'plans#new'
  
  resources :users, only: [:index, :show, :create]
  
  resources :plans, only: [:index, :show, :create, :destroy] do
    get 'courses_post', to: 'courses#new'
    post 'courses_post', to: 'courses#create'
    resources :courses, only: [:index, :destroy]
  end

end
