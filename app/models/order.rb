class Order < ApplicationRecord

  has_one :shopping_cart
  belongs_to :credit_card

end
