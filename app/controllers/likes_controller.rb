class LikesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    # binding.pry
    @like = current_user.likes.create(post_id: params[:post_id])
    if @like.save
      @likeCounts = Like.where(post_id: params[:post_id])
      respond_to do |format|
        # format.html { redirect_to post_path(@like.post.id) }
        format.json
      end
      # binding.pry
    else
      flash[:alert] = 'エラーが発生しました。'
      redirect_to post_path(@like.post.id)
    end
  end

  def destroy
    @like = Like.find_by(post_id: params[:post_id], user_id: current_user.id)
    @like.destroy
    if @like.destroy
      @likeCounts = Like.where(post_id: params[:post_id])
      respond_to do |format|
        # format.html { redirect_to post_path(@like.post.id) }
        format.json
      end
    else
      flash[:alert] = 'エラーが発生しました。'
      redirect_to post_path(@like.post.id)
    end
  end
end
