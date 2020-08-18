class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area
  belongs_to_active_hash :category
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :shipping
  belongs_to_active_hash :status

  belongs_to :user
  has_one_attached :image
  validate :image_presence

  with_options presence: true do
    validates :name, length: { maximum: 40, too_long: 'minimum is %{count}characters' }
    validates :overview, length: { maximum: 1000, too_long: 'minimum is %{count}characters' }
    validates :area
    validates :category
    validates :delivery_fee
    validates :shipping
    validates :status
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }

  def image_presence
    if image.attached?
      errors.add(:image, 'attach a jpeg or png file') unless image.content_type.in?(%('image/jpeg image/png'))
    else
      errors.add(:image, "can't be blank")
    end
  end
end
