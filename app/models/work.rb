class Work < ApplicationRecord

  belongs_to :user
  belongs_to :category
  has_many :goods, dependent: :destroy
  has_many :cart_works, dependent: :destroy
  has_many :shopping_carts, through: :cart_works

  attachment :image

  def favorited_by?(user)
    goods.where(user_id: user.id).exists?
  end

  # 作品・カテゴリー検索
  scope :get_by_keyword, -> (keyword) {where("work_name LIKE ?", "%#{keyword}%")}
  scope :get_by_category, -> (category) {where(category_id: category)}
end
