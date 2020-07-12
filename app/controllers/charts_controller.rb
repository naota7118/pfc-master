class ChartsController < ApplicationController

  def index
    gon.data = []
    @post = Post.where("calorie > ?", 1)
    gon.data << @post.select("calorie")
    binding.pry
  end
  
end
