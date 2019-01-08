Rails.application.routes.draw do
  # 首页
  root 'application#index'

  # 用户注册页面
  get '/users/signup' => 'users#new'

  # 用户注册
  post '/users/signup' => 'users#create'

  # 用户登录页面
  get '/signin' => 'sessions#new'

  # 用户登录
  post '/signin' => 'sessions#create'

  # 注销登录
  delete '/signout' => 'sessions#destroy'

end
