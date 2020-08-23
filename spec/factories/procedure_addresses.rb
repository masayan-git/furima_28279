FactoryBot.define do
  factory :procedure_address do
    postal_code { '100-1111' }
    area_id { FactoryBot.create(:area).id }
    municipalities { 'あ阿アa#11' }
    house_number { 'あ阿アa#11' }
    building { 'あ阿アa#11' }
    phone_number { '09011112222' }
    user_id { FactoryBot.create(:user).id }
    item_id { FactoryBot.create(:item).id } 
  end
end
