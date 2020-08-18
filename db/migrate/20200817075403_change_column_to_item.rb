class ChangeColumnToItem < ActiveRecord::Migration[6.0]
  def up
    change_column :items, :category,     :integer, null: false
    change_column :items, :status,       :integer, null: false
    change_column :items, :delivery_fee, :integer, null: false
    change_column :items, :area,         :integer, null: false
    change_column :items, :shipping,     :integer, null: false

  end
  def down
    change_column :items, :category,     :integer, null: false
    change_column :items, :status,       :integer, null: false
    change_column :items, :delivery_fee, :integer, null: false
    change_column :items, :area,         :integer, null: false
    change_column :items, :shipping,     :integer, null: false
  end
end
