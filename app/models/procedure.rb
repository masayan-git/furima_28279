class Procedure < ApplicationRecord
  has_one :orderer
  belongs_to :item
  belongs_to :user
end
