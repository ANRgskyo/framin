class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :image

  has_many :user_sales, class_name: 'Sale', :foreign_key => 'user_id'
  has_many :buy_user_sales, class_name: 'Sale', :foreign_key => 'buy_user_id'
  has_many :credit_cards, dependent: :destroy
  has_many :goods, dependent: :destroy
  has_one :bank


end
