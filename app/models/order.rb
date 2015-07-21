class Order < ActiveRecord::Base
  belongs_to :user
  has_many :orderitems
  has_many :items, through: :orderitems
  has_one :orderstatus
end
