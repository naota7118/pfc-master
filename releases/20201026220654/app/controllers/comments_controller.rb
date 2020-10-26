# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    # comment = Comment.create(comment_params) # createだと保存に成功したか失敗したかがわからない
    @comment = Comment.new(comment_params)
    if @comment.save
      respond_to do |format|
        format.html { redirect_to post_path(@comment.post.id) } # コメントと結びつく投稿の詳細画面に遷移する
        format.json
      end
    else
      flash[:alert] = "エラーが発生しました。"
      redirect_to post_path(@comment.post.id)
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:comment).merge(user_id: current_user.id, post_id: params[:post_id])
    end
end
