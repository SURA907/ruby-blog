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
  get '/signout' => 'sessions#destroy'

  # 文章创建页面
  get '/articles/new' => 'articles#new'

  # 新建文章
  post '/articles/new' => 'articles#create'

  # 文章展示页面
  get '/articles/:id' => 'articles#show'

  # 文章编辑页面
  get '/articles/edit/:id' => 'articles#edit'

  # 更新文章
  put '/articles/edit/:id' => 'articles#update'

  # 删除文章
  delete '/articles/:id' => 'articles#destroy'

  # 增加评论
  post '/comments' => 'comments#create'

  # 展示管理页面
  get '/admin' => 'admin#show'

end
