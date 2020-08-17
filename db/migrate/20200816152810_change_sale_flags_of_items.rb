class ChangeSaleFlagsOfItems < ActiveRecord::Migration[6.0]
  def up
    change_column :items, :sale_flags, :boolean, default: false, null: false
  end

  def down
    change_column :items, :sale_flags, :boolean, null: false, defult: false
  end
end
