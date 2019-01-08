class SessionsController < ApplicationController
  # 用户登录页面
  def new
  end
  # 用户登录
  def create
    user_param = user_params
    user = User.find_by(username: user_param[:username])
    if user && user.authenticate(user_param[:password])
      # 成功登录，创建session
      sign_in user
      redirect_to '/'
    else
      # 登陆失败
      flash.now[:danger] = '用户名和密码不匹配'
      render 'new'
    end
  end
  # 注销登录
  def destroy
  end

  private
    def user_params
      params.require(:session).permit(:username, :password)
    end
end
