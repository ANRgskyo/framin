class Work::FavoritesController < ApplicationController
  def create
  	@work = Work.find(params[:id])
    favorite = current_user.goods.new(work_id: @work.id)
    favorite.save
    render json: @work.to_json(:include => :goods)
    # redirect_to my_work_path(work.user_id)
  end

  def destroy
  	@work = Work.find(params[:id])
    favorite = current_user.goods.find_by(work_id: @work.id)
    favorite.destroy
    render json: @work.to_json(:include => :goods)
    # redirect_to my_work_path(work.user_id)
  end

end
