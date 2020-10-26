# frozen_string_literal: true

json.id @post.id
json.user_id @post.user.id
json.user_name @post.user.name
json.food @post.food
json.calorie @post.calorie
json.protein @post.protein
json.fat @post.fat
json.carbo @post.carbo
json.text @post.text
json.image @post.image_url
json.created_at @post.created_at.strftime("%Y年%m月%d日 %H時%M分")
