class UsersController < ApplicationController
  # 渲染用户注册页面
  def new
    @user = User.new
  end

  # 用户注册
  def create
    user_param = user_params
    user_param[:is_admin] = 'NO'
    @user = User.new(user_param)
    if @user.save
      redirect_to '/signin'
    else
      render 'new'
    end
  end

  private
    def user_params
      params.require(:users).permit(:username, :password, :password_confirmation)
    end
end