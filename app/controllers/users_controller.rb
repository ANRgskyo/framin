class UsersController < ApplicationController
  def show
  end

  # ユーザ編集画面表示
  def edit
    @user = User.find(params[:id])
  end

  def destroy
  end

  # ユーザ編集機能
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to user_path(params[:id])
    else
      render :edit
    end
  end

  def show_cancel
  end

  def update_cancel
  end

  def add
  end

  def follow_destroy
  end

  private
  def user_params
    params.require(:user).permit(:postal_code, :address, :phone_number, :email, :image, :introduction, :gender)
  end
end
