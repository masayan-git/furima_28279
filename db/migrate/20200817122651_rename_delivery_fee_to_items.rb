class RenameDeliveryFeeToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :delivery_fee, :delivery_fee_id
  end
end
