class WorksController < ApplicationController

  # ユーザ作品詳細表示機能
  def show
    @work = Work.find(params[:id])
  end

  # 作品編集画面表示
  def edit
    @work = Work.find(params[:id])
  end

  # 作品表示
  def index
    @work = Work.where(user_id: params[:id])
    @user = User.find(params[:id])
  end

  # 新規作品投稿表示
  def new
    @work = Work.new
  end

  # 新規作品投稿
  def create
    @work =Work.new(work_params)
    @work.user_id = current_user.id
    @work.save
    redirect_to user_path(current_user.id)
  end

  # 作品編集機能
  def update
    @work = Work.find(params[:id])
    if @work.update(work_params)
       redirect_to work_path(@work.id)
    else
      render :edit
    end
  end

  # 作品削除機能
  def destroy
    @work = Work.find(params[:id])
    @work.destroy
    redirect_to my_work_path(current_user.id)
  end

  # カート追加機能
  def add
    # ショッピングカート作成機能
    if ShoppingCart.where(user_id: current_user.id, is_active: true).empty? == true
      @shopping = ShoppingCart.new(shopping_cart_params)
      @shopping.user_id = current_user.id
      @shopping.save
    end
    # 作品追加機能
    cartwork = CartWork.new(cartwork_params)
    cartwork.work_id = (params[:id])
    shopcart = ShoppingCart.find_by(user_id: current_user.id, is_active: true)
    cartwork.shopping_cart_id = shopcart.id
    cartwork.size_id = 2
    cartwork.save
    redirect_to shopping_cart_shopping_cart_path(shopcart.id)
  end

  def collect_index
  end

  private
  def work_params
    params.require(:work).permit(
      :work_name, :image, :price, :background,
      :category_id, :is_active, :user_id
      )
  end
  def shopping_cart_params
    params.permit(:user_id, :is_active)
  end
  def cartwork_params
    params.permit(:shopping_cart_id, :work_id, :size_id, :quantity)
  end
end
