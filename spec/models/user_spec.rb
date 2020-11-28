# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do

  describe '#create' do
    it "メールアドレスがない場合は登録できないこと" do
      user = User.new(name: "aaa", email: "", password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end
    
    it "名前, メールアドレス, パスワードがあれば登録できる" do
      user = User.new(name: "John", email: "test@example.com", password: "testtest")
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
      user = User.new(name: "John", email: "test@example.com", password: password, password_confirmation: password)
      expect(user).to be_valid
    end

    it "パスワードが5文字以下だと登録できない" do
      user = User.new(email: "test@example.com", password: "pass", password_confirmation: "pass")
      user.valid?
      expect(user.errors.added?(:password, :too_short, count: 6)).to be_truthy
    end

    it "登録済みのemailアドレスでは登録できない" do
      nick = build(:nick)
      expect(nick.errors[:email]).to include()
    end
  end
  
end
