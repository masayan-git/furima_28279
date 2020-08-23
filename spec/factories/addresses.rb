FactoryBot.define do
  factory :address do
    postal_code { '100-1111' }
    area_id { '1' }
    municipalities { 'あ阿アa#11' }
    house_number { 'あ阿アa#11' }
    building { 'あ阿アa#11' }
    phone_number { '09011112222' }
    association :procedure
  end
end
