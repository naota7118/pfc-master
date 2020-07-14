class ChartsController < ApplicationController

  def index
    binding.pry
    @posts = current_user.posts.select(:calorie).map{ |posts| posts.calorie}
    gon.data = @posts
    @dates = current_user.posts.select(:created_at).map{ |posts| posts.created_at}
  end
  
end