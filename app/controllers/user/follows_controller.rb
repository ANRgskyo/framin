class User::FollowsController < ApplicationController

  # フォロー一覧表示機能
  def fed_index
  	@users = Follow.where(follower_id: params[:id]).page(params[:page]).per(13).order(followed_id: "DESC")
  	@user = User.find(params[:id])
  end

  # フォロワー一覧表示機能
  def fer_index
  	@users = Follow.where(followed_id: params[:id]).page(params[:page]).per(13).order(follower_id: "DESC")
  	@user = User.find(params[:id])
  end

end
