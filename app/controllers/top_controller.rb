class TopController < ApplicationController
  def index
    @workall = Work.all.order("RANDOM()")
  end
end
