class GuestsessionsController < ApplicationController

  def create
    user = User.find_by(email: "guest@example.com")
    session[:user_id] = user.id
    redirect_to root_path(user), notice: 'ゲストユーザーとしてログインしました'
  end

end
