require 'rails_helper'
# require '/forms/procedure_address.rb'
# bundle exec rspec spec/models/procedure_address_spec.rb

RSpec.describe ProcedureAddress, type: :model do
  describe '購入機能' do
    before do
      @buyer = FactoryBot.create(:user)
      @xhibitor = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @procedure_address = FactoryBot.build(:procedure_address)
    end

    describe '商品の購入' do
      context '購入ができる場合' do
        it '全てが正しく入力されていれば出品登録できる' do
          expect(@procedure_address).to be_valid
        end
      end
      context '購入ができない場合' do
        it '郵便番号が入力されていなければ購入できない' do
          @procedure_address.postal_code = nil
          @procedure_address.valid?
          expect(@procedure_address.errors.full_messages).to include("Postal code can't be blank", 'Postal code is invalid')
        end
        it '郵便番号が入力されていても(ー)がなければ購入できない' do
          @procedure_address.postal_code = '333333'
          @procedure_address.valid?
          expect(@procedure_address.errors.full_messages).to include('Postal code is invalid')
        end
        it '郵便番号が入力されていても数字３桁ー４桁で入力されていなければ購入できない' do
          @procedure_address.postal_code = '333-333'
          @procedure_address.valid?
          expect(@procedure_address.errors.full_messages).to include('Postal code is invalid')
        end
        it '都道府県が選択されていなければ購入できない' do
          @procedure_address.area_id = nil
          @procedure_address.valid?
          expect(@procedure_address.errors.full_messages).to include("Area can't be blank")
        end
        it '市区町村が入力されていなければ購入できない' do
          @procedure_address.municipalities = nil
          @procedure_address.valid?
          expect(@procedure_address.errors.full_messages).to include("Municipalities can't be blank")
        end
        it '番地が入力されていなければ購入できない' do
          @procedure_address.house_number = nil
          @procedure_address.valid?
          expect(@procedure_address.errors.full_messages).to include("House number can't be blank")
        end
        it '電話番号が入力されていなければ購入できない' do
          @procedure_address.phone_number = nil
          @procedure_address.valid?
          expect(@procedure_address.errors.full_messages).to include("Phone number can't be blank")
        end
        it '電話番号がが入力されていても（ー）が入っていれば購入できない' do
          @procedure_address.phone_number = '090-0000-0000'
          @procedure_address.valid?
          expect(@procedure_address.errors.full_messages).to include('Phone number is invalid')
        end
        it '電話番号がが入力されていても11桁でなければ購入できない(桁が少ない場合)' do
          @procedure_address.phone_number = '09000'
          @procedure_address.valid?
          expect(@procedure_address.errors.full_messages).to include('Phone number is invalid')
        end
        it '電話番号がが入力されていても11桁でなければ購入できない(桁が多いい場合)' do
          @procedure_address.phone_number = '090111122223'
          @procedure_address.valid?
          expect(@procedure_address.errors.full_messages).to include('Phone number is invalid')
        end
      end
    end
  end
end
