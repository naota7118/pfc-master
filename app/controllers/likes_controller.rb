class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(post_id: params[:post_id])
    if @like.save
      @likeCounts = Like.where(post_id: params[:post_id])
      respond_to do |format|
        format.html { redirect_to post_path(@like.post.id) }
        format.json
      end
    else
      flash[:alert] = 'エラーが発生しました。'
      redirect_to post_path(@like.post.id)
    end
  end

  def destroy
    @like = Like.find_by(post_id: params[:post_id], user_id: current_user.id)
    @like.destroy
    if @like.destroy
      respond_to do |format|
        format.html { redirect_to post_path(@like.post.id) }
        format.json
      end
    else
      flash[:alert] = 'エラーが発生しました。'
      redirect_to post_path(@like.post.id)
    end
  end
end
