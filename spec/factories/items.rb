FactoryBot.define do
  factory :item do
    name { '商品名' }
    overview { '商品説明' }
    category { 1 }
    status { 1 }
    delivery_fee { 1 }
    area { 1 }
    shipping { 1 }
    price { 300 }
    association :user
  end
end
