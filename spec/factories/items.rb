FactoryBot.define do
  factory :item do
    name { '商品名' }
    overview { '商品説明' }
    category_id { 1 }
    status_id { 1 }
    delivery_fee_id { 1 }
    area_id { 1 }
    shipping_id { 1 }
    price { 300 }
    association :user
  end
end
