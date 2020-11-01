json.user_name @comment.user.name
json.user_id  @comment.user.id
json.created_at @comment.created_at.strftime("%Y年%m月%d日 %H時%M分")
json.comment @comment.comment