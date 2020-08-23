FactoryBot.define do
  factory :procedure do
    association :user
    association :item
  end
end
