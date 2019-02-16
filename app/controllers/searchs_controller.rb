class SearchsController < ApplicationController
  def index
  	@table_name = params[:table_name]

  	  @qa = User.ransack(params[:q])
  	  @users = @qa.result
    
      @q = Work.ransack(params[:q])
      @works = @q.result



  end
end
