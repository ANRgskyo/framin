class Order < ApplicationRecord

  belongs_to :shopping_cart
  belongs_to :credit_card

  validates :date, timeliness: { after: :today, format: '%Y/%m/%d' }


end
