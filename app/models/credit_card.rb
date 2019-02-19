class CreditCard < ApplicationRecord

  belongs_to :user
  has_many :orders

  validates :name, presence: true, length: {in: 2..20}
  validates :card_number, length: {in: 15..16}, presence: true
  validates :month, presence: true
  validates :year, presence: true
  validates :cvc, length: { is: 3 }

end
