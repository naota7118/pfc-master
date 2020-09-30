class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :create]
  
  def index
    @posts = Post.all.includes(:user).order("created_at DESC").page(params[:page]).per(5)
    @post = Post.new
  end
  

  def create
    @post = Post.new(post_params)
    # 今日の日付を取得(simple_calendarのため)
    @post[:start_time] = Date.today.strftime('%Y-%m-%d')
    if @post.save
      redirect_back(fallback_location: root_path) # なぜredirect_to root_pathじゃダメなのかわかってない
    else
      @posts = Post.includes(:user)
      flash.now[:alert] = '必須項目をしてください。' # フラッシュメッセージが出るか確認する
      redirect_back(fallback_location: root_path)
    end
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

  def image
    @sampleuser = User.find_by(id: 2)
    if user_signed_in?
      @posts = Post.where(user_id: current_user.id).where.not(image: nil).order("created_at DESC")
    else
      @posts = Post.where(user_id: @sampleuser.id).where.not(image: nil).order("created_at DESC")
    end
  end

  private
  def post_params
    params.require(:post).permit(:food, :calorie, :protein, :fat, :carbo, :text, :image, :weight, :start_time).merge(user_id: current_user.id)
  end

end
