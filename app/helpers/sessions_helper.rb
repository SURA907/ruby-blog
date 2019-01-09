module SessionsHelper
  # 创建session，保存用户登录状态
  def sign_in(user)
    session[:user_id] = user.id
  end

  # 根据session查找并返回用户信息
  def current_user
    if session[:user_id]
      # current_user仅创建一次（对数据库的访问也仅一次）
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  # 根据session判断用户是否登录
  def signed_in?
    !current_user.nil?
  end

  # 确认用户是否为管理员
  def is_admin?
    current_user[:is_admin] == 'YES'
  end

  # 注销登录
  def sign_out
    session.delete(:user_id)
    @current_user = nil
  end
end
