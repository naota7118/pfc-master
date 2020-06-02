class PostsController < ApplicationController
  # before_action :set_post, only: [:edit, ]
  
  def index
    @posts = Post.all.includes(:user).order("created_at DESC")
    @post = Post.new # 投稿するための空のインスタンスを用意する
  end

  # def new
  #   @post = Post.new
  # end
  
  def create
    @post = Post.new(post_params) 
    @post.user_id = current_user.id
    if @post.save
      redirect_back(fallback_location: root_path) # なぜredirect_to root_pathじゃダメなのかわかってない
    else
      flash.now[:alert] = '必須項目をしてください。' # フラッシュメッセージが出るか確認する
      redirect_back(fallback_location: root_path)
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
    redirect_back(fallback_location: root_path) 
    # 削除ボタンを押したら、「id=23が見つかりません」と出てきた。なぜ？
    # 削除ボタンを押したら、sequel proでデータは消えていた。これがid=23が見つかりませんの原因だった。
    # データは削除されているのに、画面が変わらないのはなぜ？
    # 削除した後の記述をしてないからか。redirect_back root_pathを書き足した。その結果、削除が完了した後の画面になった。
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
    params.require(:post).permit(:food, :calorie, :protein, :fat, :carbo, :text, :image)
  end
end