class Sale < ApplicationRecord

  belongs_to :work
  belongs_to :size
  belongs_to :user, class_name: 'User', :foreign_key => 'user_id'
  belongs_to :buy_user, class_name: 'User', :foreign_key => 'buy_user_id'

end
