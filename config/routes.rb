Rails.application.routes.draw do
  # For details on the DSL available within this file
  # see http://guides.rubyonrails.org/routing.html
  root 'application#index'
  # get '/articles' => 'articles#index'
  get '/admin/login' => 'admin#login'
  post '/admin/login' => 'admin#signin'
end
