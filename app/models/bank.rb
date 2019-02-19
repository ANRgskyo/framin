class Bank < ApplicationRecord

  validates :bank_name, presence: true
  validates :branch_number, length: { is: 3}
  validates :account_number, length: { is: 7}
  validates :surname, presence: true
  validates :name, presence: true

  has_one :user

end
