class ShoppingCart::CartOrdersController < ApplicationController

  # 注文確認画面表示
  def show
    @order = Order.new
    @shoppingcart = ShoppingCart.find(params[:id])
    @credit = CreditCard.where(user_id: current_user.id)
    @cartworks = CartWork.where(shopping_cart_id: @shoppingcart.id)
    # 合計金額
    @pricesums = 0
  	@cartworks.each do |cw|
  	  if cw.size_id == 10
	    price = ((cw.quantity - 1) * (cw.work.price / 10)) + ( 82 * (cw.quantity - 1)) + 820 + cw.work.price
	  else
	    price = (cw.quantity * cw.work.price) + (cw.size.price * cw.quantity)
      end
    @pricesums += price
    end
  end

  def order
  	@order = Order.new(order_params)

  	@cartworks = CartWork.where(shopping_cart_id: params[:id])
    # 各作品合計金額保存機能
  	@cartworks.each do |cw|
  	  if cw.size_id == 10
	    price = ((cw.quantity - 1) * (cw.work.price / 10)) + ( 82 * (cw.quantity - 1)) + 820 + cw.work.price
	  else
	    price = (cw.quantity * cw.work.price) + (cw.size.price * cw.quantity)
      end
    cw.price = price
    cw.sale_status = 1
    end
    @cartworks.update(cartwork_params)
    # orderテーブル保存機能
    @order.postal_code = current_user.postal_code
    @order.address = current_user.address
    @order.shopping_cart_id = params[:id]
    @order.status = 1
    @order.save
    # shoppingCartテーブル　true => false 更新機能
    shoppingcart = ShoppingCart.find(params[:id])
    shoppingcart.is_active = false
    shoppingcart.update(shoppingcart_params)
    # ショッピングカート新規作成
    @shoppingcart = ShoppingCart.new
    @shoppingcart.user_id = current_user.id
    @shoppingcart.save

  end

  private
  def order_params
  	params.require(:order).permit(:date, :time, :credit_card_id)
  end
  def cartwork_params
  	params.permit(:price)
  end
  def shoppingcart_params
  	params.permit(:is_active)
  end
end
