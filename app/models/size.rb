class Size < ApplicationRecord
  
  has_many :sales, dependent: :destroy
  has_many :cart_works, dependent: :destroy

end
