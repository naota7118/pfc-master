require 'rails_helper'

RSpec.describe User, type: :model do

  it "名前, メールアドレス, パスワードがあれば登録できる" do
    user = User.new(name: 'John', email: "test@example.com", password: "testtest")
    expect(user).to be_valid
  end

  it "メールアドレスが空欄だと登録できない" do
    user = User.new(email: nil)
    user.valid?
    # expect(user.errors[:email]).to include("を入力してください")と書いてもいいが、下記は特定の言語に依存せず書ける
    expect(user.errors.added?(:email, :blank)).to be_truthy
  end

  it "パスワードが空欄だと登録できない" do
    user = User.new(password: nil)
    user.valid?
    # expect(user.errors[:password]).to include("を入力してください")と書いてもいいが、下記は特定の言語に依存せず書ける
    expect(user.errors.added?(:password, :blank)).to be_truthy
  end

  it "パスワードが6文字以上であれば登録できる" do
    password = Faker::Internet.password(min_length: 6, max_length: 6)
    user = User.new(name: 'John', email: "test@example.com", password: password, password_confirmation: password)
    expect(user).to be_valid
  end

  it "パスワードが5文字以下だと登録できない" do
    user = User.new(email: "test@example.com", password: "pass", password_confirmation: "pass")
    user.valid?
    expect(user.errors.added?(:password, :too_short, count: 6)).to be_truthy
  end

end