class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :create]
  
  def index
    @posts = Post.all.includes(:user).order("created_at DESC").page(params[:page]).per(5)
    @post = Post.new # 投稿するための空のインスタンスを用意する
    # @postと同時に@post.imagesが同時に作られる。中身は空。
    # @post.images.build
  end
  
  def create
    binding.pry
    @post = Post.new(post_params) 
    if @post.save
      # if params[:images].present?
      #   params[:images][:image].each do |image|
      #     @post.images.create(image: image, post_id: @post.id)
      #   end
      # end
      
        # respond_to do |format|
      #   format.json
      # end
      redirect_back(fallback_location: root_path) # なぜredirect_to root_pathじゃダメなのかわかってない
    else
      @posts = Post.includes(:user)
      flash.now[:alert] = '必須項目をしてください。' # フラッシュメッセージが出るか確認する
      # render :index
      redirect_back(fallback_location: root_path)
    end
    binding.pry
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user).order("created_at DESC")
    @like = Like.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_back(fallback_location: root_path) 
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to root_path
    else
      flash.now[:alert] = 'エラーが発生しました。'
      render :edit
    end
  end

  private
  def post_params
    params.require(:post).permit(:food, :calorie, :protein, :fat, :carbo, :text, :image).merge(user_id: current_user.id)
  end

end