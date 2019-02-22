class SearchsController < ApplicationController
  before_action :authenticate_user!

  # 検索機能
  def index
  	@table_name = params[:table_name]
    if @table_name == 'User'
      @searched = User.search(params[:keyword])
    else
      @searched = Work.all
      if params[:keyword].present? && params[:category].present? == false
      	@searched = @searched.get_by_keyword params[:keyword]
      end
      if params[:category].present? && params[:keyword].present? == false
      	@searched = @searched.get_by_category params[:category]
      end
      if params[:category].present? && params[:keyword].present?
      	@key = @searched.get_by_keyword params[:keyword]
      	@category = @searched.get_by_category params[:category]
        @searched = @key & @category
      end
    end
  end

end
