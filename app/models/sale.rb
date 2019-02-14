class Sale < ApplicationRecord

  belongs_to :size
  belongs_to :user
  belongs_to :buy_user. class_name: 'User'

end
