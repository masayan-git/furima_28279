class ProcedureAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :area_id, :municipalities, :house_number, :building, :phone_number

  with_options presence: true do
    post_vali = /\A\d{3}[-]\d{4}\z/
    phone_vali = /\A\d{11}\z/
    validates :postal_code, format: { with: post_vali }
    validates :area_id
    validates :municipalities
    validates :house_number
    validates :phone_number, format: { with: phone_vali }
  end


  def save
    item = Item.find(item_id)
    unless item.user.id == user_id
      pro = Procedure.create(item_id: item_id, user_id: user_id)
      Address.create(postal_code: postal_code, area_id: area_id, municipalities: municipalities, house_number: house_number, phone_number: phone_number, building: building, procedure_id: pro.id)
      item.update(sale_flags: true)
    end
  end
end
