class ArticlesController < ApplicationController
  # 文章展示
  def show
    @comment = Comment.where(article_id: params[:id]).order(:created_at => :desc)
    @article = Article.find_by(id: params[:id])
    @user = current_user
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
      # 保存成功，重定向至文章展示页面
      redirect_to "/articles/#{@article[:id]}"
    else
      # 保存失败
      render 'new'
    end
  end

  # 编辑文章页面
  def edit
    # 用户权限
    if is_admin?
      # 管理员
      @article = Article.find_by(id: params[:id])
    else
      # 非管理员，检查文章作者
      article = Article.find_by(id: params[:id])
      if article[:user_id] == current_user[:id]
        # 用户是文章作者
        @article = article
      else
        # 用户不是文章作者
        render html: '401，你没有编辑此文章的权限'
      end
    end
  end

  # 编辑文章
  def update
    # 用户权限
    if is_admin?
      # 管理员
      @article = Article.find_by(id: params[:id])
      update_article
    else
      # 非管理员，检查文章作者
      @article = Article.find_by(id: params[:id])
      if @article[:user_id] == current_user[:id]
        # 用户是文章作者
        update_article
      else
        # 用户不是文章作者
        render html: '401，你没有编辑此文章的权限'
      end
    end
  end

  # 删除文章
  def destroy
    @article = Article.find_by(id: params[:id])
    # 确认用户权限
    if is_admin?
      # 管理员
      destroy_article
    else
      # 普通用户
      if @article[:user_id] == current_user[:id]
        # 用户是文章创建者
        destroy_article
      else
        # 用户不是文章创建者
        render html: '401, 你没有删除此文章的权限'
      end
    end
  end

  private
    # 过滤参数
    def user_params
      params.require(:article).permit(:title, :content)
    end

    # update文章数据
    def update_article
      @article[:title] = user_params[:title]
      @article[:content] = user_params[:content]
      if @article.save
        # 更新成功
        redirect_to "/articles/#{@article[:id]}"
      else
        render 'edit'
      end
    end

    # destroy 文章数据
    def destroy_article
      @article.destroy
      redirect_to '/admin'
    end

end