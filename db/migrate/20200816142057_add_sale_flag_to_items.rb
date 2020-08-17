class AddSaleFlagToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :sale_flag, :boolean
  end
end
