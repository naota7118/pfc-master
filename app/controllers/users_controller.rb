class UsersController < ApplicationController

  def show
    if user_signed_in?
      @user = User.find(params[:id])
      @posts = Post.where(user_id: @user.id).order("created_at DESC").page(params[:page]).per(5)
      @calorie = @user.posts.order("created_at DESC").group("date(created_at)").sum(:calorie)
    else
      @sampleuser = User.find_by(id: 3)
      @posts = Post.where(user_id: @sampleuser.id).order("created_at DESC").page(params[:page]).per(5)
      @calorie = @sampleuser.posts.order("created_at DESC").group("date(created_at)").sum(:calorie)
    end
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
    if user_signed_in?
      @user = User.find(params[:id])
      @users = @user.followings
    else
      @sampleuser = User.find_by(id: 2)
      @users = @sampleuser.followings
    end
    render 'show_following'
  end

  def followers
    if user_signed_in?
      @user = User.find(params[:id])
      @users = @user.followings
    else
      @sampleuser = User.find_by(id: 2)
      @users = @sampleuser.followings
    end
    render 'show_follower'
  end

  private

  def user_params
    params.require(:user).permit(:id, :name, :email)
  end

end
