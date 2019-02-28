class History::OrdersController < ApplicationController
  before_action :authenticate_user!

  # 購入履歴一覧表示機能
  def index_order
  	@shopping = ShoppingCart.where(user_id: current_user.id, is_active: false).page(params[:page]).per(13).order(id: "DESC")
  end

  # 販売履歴一覧表示機能
  def index_sale
  	@myworks = Work.where(user_id: current_user.id).pluck(:id)
    @shopping = ShoppingCart.where(is_active: false).pluck(:id)
  	@cartworks = CartWork.where(work_id: @myworks, shopping_cart_id: @shopping).page(params[:page]).per(13).order(id: "DESC")
  end

end
