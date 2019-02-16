class TopController < ApplicationController

  # トップ表示機能
  def index
    @workall = Work.all.order("RANDOM()")
  end

end
