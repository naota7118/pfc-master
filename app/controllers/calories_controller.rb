class CaloriesController < ApplicationController
  def index
    binding.pry
    # 今日のカロリー合計
    gon.today_sum = Post.where(user_id: current_user.id).sum(:calorie)

    
    # current_userのカロリー目安
    gon.standard = Standard.find_by(user_id: current_user.id)
    binding.pry
  end
end