# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
t.references :user, 	      null: false, foreign_key: true
      t.text	:image,             null: false
      t.integer	:price,           null: false
      t.string	:name,            null: false
      t.text	:overview,          null: false
      t.references	:buyer,                   foreign_key: true
      t.integer	:category,        null: false
      t.integer	:status,          null: false
      t.integer	:delivery_fee,    null: false
      t.integer	:area,            null: false
      t.integer	:shipping,        null: false
      t.timestamps
    end