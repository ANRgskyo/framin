class ShoppingCart < ApplicationRecord

  belongs_to :user
  has_one :order
  has_many :cart_works
  has_many :works, through: :cart_works, dependent: :destroy
  
end
