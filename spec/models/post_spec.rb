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
    curry = create(:curry, user_id: john.id)
    post = Post.new(food: "カレー", calorie: '100',id: '1', protein: nil, fat: nil, carbo: nil, text: nil, image: nil, created_at: '2020-12-20', updated_at: '2020-12-20', user_id: 1, weight: nil, start_time: '2020-12-20')
    post = Post.new(id: nil, food: "カレー", calorie: 500.0, protein: nil, fat: nil, carbo: nil, text: nil, image: nil, created_at: nil, updated_at: nil, user_id: 1, weight: nil, start_time: nil)
    expect(post).to be_valid
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
