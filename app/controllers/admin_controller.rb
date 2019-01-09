class AdminController < ApplicationController
  def show
    # 未登录用户重定向至登陆页面
    if !signed_in?
      redirect_to '/signin'
    end
    # 确认用户权限
    # @article_list
    if is_admin?
      # 管理员可编辑，删除所有文章
      @article_list = Article.all.order(:created_at => :desc)
    else
      # 普通用户仅可查看自己的文章
      @article_list = Article.where(:user_id => current_user[:id]).order(:created_at => :desc)
    end
  end
end
