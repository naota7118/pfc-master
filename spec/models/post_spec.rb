require 'rails_helper'

RSpec.describe Post, type: :model do
  
  it "foodが空欄だと投稿できない" do
    post = Post.new(food: nil, calorie: 1000)
    post.valid?
    expect(post.errors.added?(:food, :blank)).to be_truthy
  end

  it "calorieが空欄だと投稿できない" do
    post = Post.new(food: 'カレー', calorie: nil)
    post.valid?
    expect(post.errors.added?(:calorie, :blank)).to be_truthy
  end

end