class Transaction < ApplicationRecord
  has_one :orderer
  belongs_to :item
  belongs_to :user
end
