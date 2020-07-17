class ChartsController < ApplicationController

  def index
    # 日付ごとで分けてカロリー合計を算出
    sum_calorie = current_user.posts.group("date(created_at)").sum(:calorie)
    # 日付ごとのカロリー合計がハッシュの形なので値を取得して配列に入れて変数に代入
    array_calorie = sum_calorie.values

    # gonを使ってデータをjs側に渡す
    gon.data = []
    # mapメソッドで日付ごとのカロリー合計を1つずつ取り出す
    # mapメソッドの使い方 → 配列変数.map {|変数名| 具体的な処理 }
    binding.pry
    gon.data = array_calorie.map{ |calorie| calorie}

    # 日付ごとにまとめてそのうちcreated_atカラムだけ取得。配列の形で格納されている
    dates_calorie = current_user.posts.group("date(created_at)").select(:created_at)

    gon.date = []
    @dates = dates_calorie.map{ |dates| dates.created_at}
    # each文で日付の表記を1つずつ取り出して変える
    @dates.each do |a|
      gon.date << a.strftime("%Y年%m月%d日")
    end
  end
  
end