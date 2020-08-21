class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area
  belongs_to :procedure

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :area_id
    validates :municipalities
    validates :house_number
    validates :phone_number, format: { with: /\A\d{11}\z/ }
  end
end
