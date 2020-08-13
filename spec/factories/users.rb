FactoryBot.define do
  # Faker::Config.locale = :ja
  factory :user do
    nickname { 'textname' }
    email { Faker::Internet.free_email }
    # password = Faker::Internet.password(min_length: 6)
    password = 'abcde6'
    password { password }
    password_confirmation { password }
    first_name { '山田やマだ' }
    last_name { '太郎たロう' }
    first_name_reading { 'ヤマダ' }
    last_name_reading { 'タロウ' }
    birthday { Faker::Date.between(from: '1930-01-01', to: '2015-12-31') }
  end
end
