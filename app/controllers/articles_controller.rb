class ArticlesController < ApplicationController
  # 文章展示
  def show
    @article = Article.find_by(id: params[:id])
  end

  # 新建文章页面
  def new
    @article = Article.new
    # 未登录，重定向至登录页面
    if !signed_in?
      redirect_to '/signin'
    end
  end

  # 新建文章
  def create
    # 未登录重定向至登陆页面
    if !signed_in?
      redirect_to '/signin'
    end
    user_param = user_params
    user_param[:user_id] = current_user[:id]
    user_param[:author] = current_user[:username]
    @article = Article.new(user_param)
    if @article.save
      # 保存成功
      redirect_to '/'
    else
      # 保存失败
      render 'new'
    end
  end

  # 编辑文章页面
  def edit
  end

  # 编辑文章
  def update
  end

  # 删除文章
  def destroy
  end

  private
    def user_params
      params.require(:article).permit(:title, :content)
    end
end