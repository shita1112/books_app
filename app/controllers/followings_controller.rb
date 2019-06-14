class FollowingsController < ApplicationController
  before_action :authenticate_user!

  def create
    user = User.find(params[:followee_id])
    current_user.follow(user)
    redirect_back fallback_location: root_path, notice: t(".created")
  end

  def destroy
    Following.destroy(params[:id])
    redirect_back fallback_location: root_path, notice: t(".destroyed")
  end
end
