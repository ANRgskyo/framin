class Config::CreditsController < ApplicationController
  # 新規クレジット投稿表示
  def credit_new
    @credit = CreditCard.new
  end

  # 新規クレジット作成機能
  def credit_create
    @credit = CreditCard.new(credit_params)
    @credit.user_id = current_user.id
    if @credit.save
       redirect_to config_index_path
    else
       render :credit_new
    end
  end

  # クレジット編集画面表示
  def edit
    @credit = CreditCard.find(params[:id])
  end

  # クレジット編集機能
  def update
    @credit = CreditCard.find(params[:id])
    if @credit.update(credit_params)
       redirect_to config_index_path
    else
       render :edit
    end
  end

  # クレジット削除機能
  def credit_destroy
    @credit = CreditCard.find(params[:id])
    @credit.destroy
    redirect_to config_index_path
  end

  private
  def credit_params
    params.require(:credit_card).permit(:name, :card_number, :month, :year, :cvc, :user_id)
  end
end
