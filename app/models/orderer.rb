class Orderer < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area
  belongs_to :transactions, class_name:'Transaction',foreign_key: 'transaction_id'
end
