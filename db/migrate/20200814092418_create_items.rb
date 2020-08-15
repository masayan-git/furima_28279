class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.bigint :user_id,	        foreign_key: true
      t.text	:image,             null: false
      t.integer	:price,           null: false
      t.string	:name,            null: false
      t.text	:overview,          null: false
      t.integer	:category,        null: false
      t.integer	:status,          null: false
      t.integer	:delivery_fee,    null: false
      t.integer	:area,            null: false
      t.integer	:shipping,        null: false
      t.timestamps
    end
  end
end
