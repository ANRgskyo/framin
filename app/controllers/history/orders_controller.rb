class History::OrdersController < ApplicationController

  # 購入履歴一覧表示機能
  def index_order
  	@shopping = ShoppingCart.where(user_id: current_user.id, is_active: false).page(params[:page]).per(13).order(id: "DESC")
  end

  # 販売履歴一覧表示機能
  def index_sale
  	@myworks = Work.includes(cart_works: :shopping_cart).where(user_id: current_user.id).page(params[:page]).per(13).order("cart_works.shopping_cart_id DESC")
  end

end
