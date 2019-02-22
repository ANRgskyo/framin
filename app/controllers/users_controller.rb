class UsersController < ApplicationController
  before_action :authenticate_user!

  # ユーザMy page表示機能
  def show
    @user = User.find(params[:id])
    @work = Work.where(user_id: params[:id])
  end

  # ユーザ編集画面表示
  def edit
    @user = User.find(params[:id])
  end

  # ユーザ退会機能
  def destroy
    @user = User.find(current_user.id)
    @user.destroy
    redirect_to root_path
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

  # フォロー機能
  def add
    @user = User.find(params[:id])
    current_user.follow!(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  # フォロー解除機能
  def follow_destroy
    @user = User.find(params[:id])
    current_user.unfollow!(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  private
  def user_params
    params.require(:user).permit(:postal_code, :address, :phone_number, :email, :image, :introduction, :gender)
  end
end
