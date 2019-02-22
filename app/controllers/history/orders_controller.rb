class History::OrdersController < ApplicationController
  before_action :authenticate_user!

  # 購入履歴一覧表示機能
  def index_order
  	@shopping = ShoppingCart.where(user_id: current_user.id, is_active: false).page(params[:page]).per(13).order(id: "DESC")
  end

  # 販売履歴一覧表示機能
  def index_sale
  	@myworks = Work.where(user_id: current_user.id).pluck(:id)
  	@cartworks = CartWork.where(work_id: @myworks).page(params[:page]).per(13).order(id: "DESC")
  end

end
