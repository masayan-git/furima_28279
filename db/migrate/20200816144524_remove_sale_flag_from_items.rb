class RemoveSaleFlagFromItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :sale_flag, :boolean
  end
end
