class ChartsController < ApplicationController

  def index
    @posts = current_user.posts.select(:calorie).map{ |posts| posts.calorie}
    gon.data = @posts
  end
  
end