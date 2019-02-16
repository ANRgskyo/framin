class Work::FavoritesController < ApplicationController

  # いいね機能
  def create
  	@work = Work.find(params[:id])
    favorite = current_user.goods.new(work_id: @work.id)
    favorite.save
    render json: @work.to_json(:include => :goods)
  end

  # いいね削除機能
  def destroy
  	@work = Work.find(params[:id])
    favorite = current_user.goods.find_by(work_id: @work.id)
    favorite.destroy
    render json: @work.to_json(:include => :goods)
  end

end
