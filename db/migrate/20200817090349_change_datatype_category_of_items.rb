class ChangeDatatypeCategoryOfItems < ActiveRecord::Migration[6.0]
  def change
    change_column :items, :category, :integer
  end
end
