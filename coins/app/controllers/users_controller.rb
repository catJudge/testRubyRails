class UsersController < ApplicationController
  before_action :authenticate_user!


  def index
    if current_user.is_admin?
      @users = User.all
    else
      @users = [current_user]
    end
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user or current_user.is_admin
      redirect_to :back, :alert => "Access denied."
    end
  end

end
