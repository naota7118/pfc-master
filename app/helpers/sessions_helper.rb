module SessionsHelper
  # 渡されたユーザーでログインする
  def log_in(user)
    session[:uid] = user.uid
  end

  # 現在ログイン中のユーザーを返す (いる場合)
  def current_user
    if session[:uid]
      @current_user ||= User.find_by(uid: session[:uid])
    end
  end

  # ユーザーがログインしていればtrue、その他ならfalseを返す
  def logged_in?
    !current_user.nil?
  end

  # 現在のユーザーをログアウトする
  def log_out
    session.delete(:uid)
    @current_user = nil
  end
end