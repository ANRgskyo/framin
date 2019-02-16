class Size < ApplicationRecord

  has_many :cart_works, dependent: :destroy

end
