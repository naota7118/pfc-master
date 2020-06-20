class UsersController < ApplicationController

  def show
    binding.pry
    @user = User.find(params[:id])
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
    @user = User.find(id: params[:id])
    binding.pry
    @users = @user.followings
    render 'show_following'
  end

  def followers
    @user = User.find(id: params[:id])
    binding.pry
    @users = @user.followers
    render 'show_follower'
  end

  private

  def user_params
    params.require(:user).permit(:id, :name, :email)
  end

end
