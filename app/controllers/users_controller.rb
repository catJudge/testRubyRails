class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create, :destroy]
  before_filter :find_user, except: [:index]

  def index
    if current_user.is_admin?
      @users = User.all
    else
      @users = [current_user]
    end
  end

  def show
    unless @user == current_user or current_user.is_admin
      redirect_to :back, :alert => "Access denied."
    end
  end

  def edit
    unless @user == current_user or current_user.is_admin
      redirect_to :root, :alert => "Access denied."
    end

  end

  def update
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

  def find_user
    @user = User.find(params[:id])
  end

end
