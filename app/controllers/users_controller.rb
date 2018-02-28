class UsersController < ApplicationController
  def index
    @users = User.all
    @search = User.ransack(params[:q])
    @result = @search.result
  end

  def show
    @user = User.find(params[:id])
  end
end
