require "rails_helper"

RSpec.describe Post, type: :model do
  it "foodが空欄だと投稿できない" do
    post = Post.new(food: nil, calorie: 1000)
    post.valid?
    expect(post.errors.added?(:food, :blank)).to be_truthy
  end

  it "calorieが空欄だと投稿できない" do
    post = Post.new(food: "カレー", calorie: nil)
    post.valid?
    expect(post.errors.added?(:calorie, :blank)).to be_truthy
  end

  it "foodとcalorieがあれば投稿できる" do
    # john = create(:john)
    # curry = create(:curry, user_id: john.id)
    post = Post.new(food: "カレー", calorie: '100')
    expect(curry).to be_valid
  end

  # it "protein, fat, carboが空欄でも投稿できる" do
  #   john = create(:john)
  #   saladchicken = create(:saladchicken, user_id: john.id)
  #   expect(saladchicken).to be_valid
  # end

  # it "textが空欄でも投稿できる" do
  #   john = create(:john)
  #   natto = create(:natto, user_id: john.id)
  #   expect(natto).to be_valid
  # end

  # it "imageが空欄でも投稿できる" do
  #   john = create(:john)
  #   udon = create(:udon, user_id: john.id)
  #   expect(udon).to be_valid
  # end
end
