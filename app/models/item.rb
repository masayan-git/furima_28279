class Item < ApplicationRecord
  
  belongs_to :user
  has_one_attached :image
  validate :image_presence

  with_options presence: true do
    validates :user_id
    validates :price
    validates :name
    validates :overview
    validates :category
    validates :status
    validates :delivery_fee	
    validates :shipping
  end
  
  validates :area, numericality: { other_than: 0, message:''} 

  def image_presence
    if image.attached?
      if !image.content_type.in?(%('image/jpeg image/png'))
        errors.add(:image, 'にはjpegまたはpngファイルを添付してください')
      end
    else
      errors.add(:image, 'には出品画像を添付してください')
    end
  end
end
