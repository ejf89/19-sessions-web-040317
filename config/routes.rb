Rails.application.routes.draw do
  # get '/students', to: 'students#index', as: 'students'
  # get '/students/new', to: 'students#new', as: 'new_student'
  # post '/students', to: 'students#create'
  # get '/developers', to: 'students#index', as: 'students'
  resources :students, except: [ :destroy ]
  resources :wolves
  # resources :dogs, only: [:index, :new, :create]
  root('students#index')

  get '/login', to: 'sessions#new', as: 'login'
  post '/sessions', to: 'sessions#create', as: 'sessions'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
