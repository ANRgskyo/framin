class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :image


  has_many :active_follows, class_name: "Follow", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_follows, class_name: "Follow", foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_follows, source: :followed
  has_many :followers, through: :passive_follows, source: :follower
  has_many :credit_cards, dependent: :destroy
  has_many :goods, dependent: :destroy
  has_many :shopping_cart, dependent: :destroy
  has_one :bank

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
