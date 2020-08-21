require 'rails_helper'
# bundle exec rspec spec/models/address_spec.rb
# binding.pry
RSpec.describe Address, type: :model do
  describe '#create' do
    before do
      @address = FactoryBot.build(:address)
    end

    describe '商品の購入' do
      context '購入ができる場合' do
        it '全てが正しく入力されていれば出品登録できる' do
          expect(@address).to be_valid
        end
      end
      context '購入ができない場合' do
        it '郵便番号が入力されていなければ購入できない' do
          @address.postal_code = nil
          @address.valid?
          expect(@address.errors.full_messages).to include("Postal code can't be blank", 'Postal code is invalid')
        end
        it '郵便番号が入力されていても(ー)がなければ購入できない' do
          @address.postal_code = '333333'
          @address.valid?
          expect(@address.errors.full_messages).to include('Postal code is invalid')
        end
        it '郵便番号が入力されていても数字３桁ー４桁で入力されていなければ購入できない' do
          @address.postal_code = '333-333'
          @address.valid?
          expect(@address.errors.full_messages).to include('Postal code is invalid')
        end
        it '都道府県が選択されていなければ購入できない' do
          @address.area_id = nil
          @address.valid?
          expect(@address.errors.full_messages).to include("Area can't be blank")
        end
        it '市区町村が入力されていなければ購入できない' do
          @address.municipalities = nil
          @address.valid?
          expect(@address.errors.full_messages).to include("Municipalities can't be blank")
        end
        it '番地が入力されていなければ購入できない' do
          @address.house_number = nil
          @address.valid?
          expect(@address.errors.full_messages).to include("House number can't be blank")
        end
        it '電話番号が入力されていなければ購入できない' do
          @address.phone_number = nil
          @address.valid?
          expect(@address.errors.full_messages).to include("Phone number can't be blank")
        end
        it '電話番号がが入力されていても（ー）が入っていれば購入できない' do
          @address.phone_number = '090-0000-0000'
          @address.valid?
          expect(@address.errors.full_messages).to include('Phone number is invalid')
        end
        it '電話番号がが入力されていても11桁でなければ購入できない(桁が少ない場合)' do
          @address.phone_number = '09000'
          @address.valid?
          expect(@address.errors.full_messages).to include('Phone number is invalid')
        end
        it '電話番号がが入力されていても11桁でなければ購入できない(桁が多いい場合)' do
          @address.phone_number = '090111122223'
          @address.valid?
          expect(@address.errors.full_messages).to include('Phone number is invalid')
        end
      end
    end
  end
end
