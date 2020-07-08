require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    it "メールアドレスがない場合は登録できないこと" do
      user = User.new(name: "", email: "", password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
  end 
end