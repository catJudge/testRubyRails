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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:is_admin)
  end

end
