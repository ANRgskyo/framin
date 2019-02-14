class CartWork < ApplicationRecord

  belongs_to :work
  belongs_to :shopping_cart
  belongs_to :size

end
