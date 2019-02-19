class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attachment :image

  # 論理削除機能
  acts_as_paranoid

  has_many :active_follows, class_name: "Follow", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_follows, class_name: "Follow", foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_follows, source: :followed
  has_many :followers, through: :passive_follows, source: :follower
  has_many :credit_cards, dependent: :destroy
  has_many :goods, dependent: :destroy
  has_many :shopping_cart, dependent: :destroy
  has_one :bank

  validates :name, presence: true
  validates :name_kana, presence: true
  validates :postal_code, presence: true, length: { is: 7 }, numericality: true
  validates :address, presence: true
  validates :phone_number, presence: true, numericality: true
  validates :email, presence: true
  validates :introduction, length: { maximum: 500 }

  # ユーザをフォロー
  def follow!(other_user)
  	active_follows.create(followed_id: other_user.id)
  end

  # ユーザをアンフォロー
  def unfollow!(other_user)
  	active_follows.find_by(followed_id: other_user.id).destroy
  end

  # 今のユーザがフォローしていたらtrueを返す
  def following?(other_user)
  	following.include?(other_user)
  end

  # ユーザ検索
  def self.search(keyword)
    if keyword
      where(['name LIKE ?', "%#{keyword}%"])
    else
      User.all
    end
  end

end
