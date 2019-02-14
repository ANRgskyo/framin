class ConfigsController < ApplicationController

  # ユーザ設定画面表示
  def index
    @credit = CreditCard.where(user_id: current_user.id)
    if @banks =Bank.find_by(user_id: current_user.id).nil? == false
      @banks = Bank.find_by(user_id: current_user.id)
      if @banks.bank_name == 1
    	  @bank_name = "三菱UFJ"
      elsif @banks.bank_name == 2
    	  @bank_name = "みずほ銀行"
      elsif @banks.bank_name == 3
      	  @bank_name ="三井住友銀行"
      elsif @banks.bank_name == 4
    	  @bank_name ="りそな銀行"
      end
    else
       @banks =Bank.find_by(user_id: current_user.id)
    end
  end

  # 銀行振込先削除機能
  def bank_destroy
  	@bank = Bank.find_by(user_id: current_user.id)
  	@bank.destroy
  	redirect_to config_index_path
  end
end
