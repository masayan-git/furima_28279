class AddSaleFlagsToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :sale_flags, :boolean, null: false, defult: false
  end
end
