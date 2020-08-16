class RemoveItemFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_reference :users, :item
  end
end
