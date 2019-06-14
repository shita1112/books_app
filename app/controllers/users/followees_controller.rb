class Users::FolloweesController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.find(params[:user_id]).followees
    render "users/index"
  end
end
