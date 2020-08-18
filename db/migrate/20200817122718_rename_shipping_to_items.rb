class RenameShippingToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :shipping, :shipping_id
  end
end
