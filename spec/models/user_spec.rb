require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
    it "nickname、email、password、password_confirmation、first_name、last_name、first_name_reading、last_name_reading、birthday	があれば登録できること" do
      expect(@user).to be_valid
    end
    it "nicknameが空では登録できないこと" do
      @user.nickname = ""
      @user.valid?
      binding.pry
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できないこと" do
    end
    it "passwordが空では登録できないこと" do
    end
    it "password_confirmationが空では登録できないこと" do
    end
    it "first_nameが空では登録できないこと" do
    end
    it "last_nameが空では登録できないこと" do
    end
    it "first_name_readingが空では登録できないこと" do
    end
    it "last_name_readingが空では登録できないこと" do
    end
    it "birthdayが空では登録できないこと" do
    end
    it "が空では登録できないこと" do
    end
    it "が空では登録できないこと" do
    end
    
  end
end
