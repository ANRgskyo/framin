class Order < ApplicationRecord

  has_one :shopping_cart
  belongs_to :credit_card

  validates :date, timeliness: { after: :today, format: '%Y/%m/%d' }


end
