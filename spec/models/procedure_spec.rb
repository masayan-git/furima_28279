require 'rails_helper'
# bundle exec rspec spec/models/procedure_spec.rb

RSpec.describe Procedure, type: :model do
  describe '#create' do
    before do
      @buyer = FactoryBot.create(:user)
      @xhibitor = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      # binding.pry
      @item.user.id = @xhibitor.id
      @procedure = FactoryBot.build(:procedure)
      # binding.pry
    end

    describe '商品の購入' do
      context '購入ができない場合' do
        it '出品者は購入できない' do
          @procedure.item_id = @item.id
          @procedure.user_id = @xhibitor.id
          @procedure.valid?
          binding.pry
        end
      end
    end
  end
end
