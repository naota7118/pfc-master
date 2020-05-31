class PostsController < ApplicationController
  
  def index
    @post = Post.new
    @posts = Post.all.includes(:user).order("created_at DESC")
  end

  # def new
  #   @post = Post.new
  # end
  
  def create
    binding.pry
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      flash.now[:alert] = '必須項目をしてください。'
      render :index
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end

  def update
    @post = Post.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      flash.now[:alert] = 'エラーが発生しました。'
      render :edit
    end
  end

  private
  def post_params
    params.require(:post).permit(:food, :calorie, :protein, :fat, :carbo, :text, :image)
  end
end