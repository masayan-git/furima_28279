class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validate :image_presence

  with_options presence: true do
    validates :name, length: { maximum: 40, too_long: 'minimum is %{count}characters' }
    validates :overview, length: { maximum: 1000, too_long: 'minimum is %{count}characters' }
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }
  validates :area, numericality: { other_than: 0, message: "can't be blank" }
  validates :category, numericality: { other_than: 0, message: "can't be blank" }
  validates :delivery_fee, numericality: { other_than: 0, message: "can't be blank" }
  validates :shipping, numericality: { other_than: 0, message: "can't be blank" }
  validates :status, numericality: { other_than: 0, message: "can't be blank" }

  def image_presence
    if image.attached?
      errors.add(:image, 'attach a jpeg or png file') unless image.content_type.in?(%('image/jpeg image/png'))
    else
      errors.add(:image, "can't be blank")
    end
  end
end
