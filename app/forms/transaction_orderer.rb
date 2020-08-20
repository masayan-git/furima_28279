class TransactionOrderer
  include ActiveModel::Model
  attr_accessor :user_id, :item_id,:postal_code, :area_id, :municipalities, :house_number,:building,:phone_number

  def save
    tra = Transaction.create(item_id: item_id, user_id: user_id)
    Orderer.create!(postal_code: postal_code, area_id: area_id, municipalities: municipalities, house_number: house_number, phone_number: phone_number, building: building, transaction_id: tra.id)
    itemflag = Item.find(item_id)
    itemflag.update(sale_flags: true)
  end

end