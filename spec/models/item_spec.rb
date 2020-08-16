require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
    end

    it '全て正しく入力されていれば出品登録できる' do
      expect(@item).to be_valid
    end

    it 'ログインしているユーザーだけが出品登録できる' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end

    it '画像がなければ出品登録できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名がなければ出品登録できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'カテゴリーの情報がなければ出品登録できないこと' do
      @item.category = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it '商品の状態についての情報がなければ出品登録できないこと' do
      @item.status = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end

    it '配送料についての情報がなければ出品登録できないこと' do
      @item.delivery_fee = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
    end

    it '発送元の地域についての情報がなければ出品登録できないこと' do
      @item.area = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Area can't be blank")
    end

    it '発送までの日数についての情報がなければ出品登録できないこと' do
      @item.shipping = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping can't be blank")
    end

    it '価格についての情報ががなければ出品登録できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range')
    end

    it '価格の範囲が300~9,999,999の間でなければ出品登録できないこと' do
      @item.price = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range')
    end
  end
end
