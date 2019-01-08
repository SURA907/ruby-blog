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

  # 文章创建页面
  get '/articles/new' => 'articles#new'
  # 新建文章
  post '/articles/new' => 'articles#create'
  # 文章展示页面
  get '/articles/:id' => 'articles#show'
end
