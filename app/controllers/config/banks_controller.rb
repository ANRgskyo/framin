class Config::BanksController < ApplicationController

  # 銀行登録ページ表示機能
  def bank_new
  	@bank = Bank.new
  end

  # 銀行登録機能
  def bank_create
    @bank =Bank.new(bank_params)
    @bank.user_id = current_user.id
    @bank.save
    redirect_to config_index_path
  end

  private
  def bank_params
  	params.require(:bank).permit(:bank_name, :branch_number, :account_number, :surname, :name)
  end
end
