class ShoppingCart::CartsController < ApplicationController
  before_action :authenticate_user!

  # カート表示機能
  def index
  	@cartworks = CartWork.where(shopping_cart_id: (params[:id])).order(id: "DESC")
    # 合計計算
  	@pricesums = 0
  	@cartworks.each do |cw|
  	  if cw.size_id == 9
	    price = ((cw.quantity - 1) * (cw.work.price / 10)) + ( 82 * (cw.quantity - 1)) + 820 + cw.work.price
	  else
	    price = (cw.quantity * cw.work.price) + (cw.size.price * cw.quantity)
      end
      @pricesums += price
    end
  end

  # サイズ変更機能
  def update
    cw = CartWork.find(params[:cart_work_id])
    cw.update(size_params)
    redirect_to shopping_cart_shopping_cart_path(params[:id])
  end

  # 枚数変更機能
  def pass
    cw = CartWork.find(params[:cart_work_id])
    if params[:status] == "0"
       cw.quantity += 1
       cw.save
    else
       cw.quantity -= 1
       cw.save
    end
    redirect_to shopping_cart_shopping_cart_path(params[:id])
  end

  # 作品カート内削除
  def destroy
  	cw = CartWork.find(params[:cart_work_id])
  	cw.destroy
    redirect_to shopping_cart_shopping_cart_path(params[:id])
  end

  private
  def size_params
  	params.require(:cart_work).permit(:size_id)
  end
end
