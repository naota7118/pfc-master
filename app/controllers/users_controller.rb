class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id).order("created_at DESC")
    @calorie = @user.posts.order("created_at DESC").group("date(created_at)").sum(:calorie)
  end
  
  def edit
    
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def following
    @user = User.find(params[:id])
    @users = @user.followings
    render 'show_following'
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end

  private

  def user_params
    params.require(:user).permit(:id, :name, :email)
  end

end
