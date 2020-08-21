class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :create]
  
  def index
    @posts = Post.all.includes(:user).order("created_at DESC").page(params[:page]).per(5)
    @post = Post.new
    # 今日の合計カロリー
    if user_signed_in?
      @calorie_sum = Post.where(user_id: current_user.id, created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).sum(:calorie)
      gon.today_sum = @calorie_sum
      @standard = Standard.find_by(user_id: current_user.id)
      @calorie_standard = @standard.calorie
      gon.standard = @calorie_standard
      if @calorie_sum >= @calorie_standard
        @difference = @calorie_sum - @calorie_standard
      else
        @difference = @calorie_standard - @calorie_sum
      end
    else
      
    end
  end

  def create
    @post = Post.new(post_params) 
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
    # @images = Post.where(user_id: current_user.id).select(:image).map{ |image| image[:image]}
    binding.pry
    @posts = Post.where(user_id: current_user.id)
    binding.pry
  end

  private
  def post_params
    params.require(:post).permit(:food, :calorie, :protein, :fat, :carbo, :text, :image).merge(user_id: current_user.id)
  end

end