class RemoveOrdererIdFromOrderers < ActiveRecord::Migration[6.0]
  def change
    remove_reference :orderers, :orderer, null: false, foreign_key: true
  end
end
