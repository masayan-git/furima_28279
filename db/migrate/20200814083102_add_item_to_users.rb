class AddItemToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :item, foreign_key: true
  end
end
