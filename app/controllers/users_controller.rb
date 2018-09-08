class UsersController < ApplicationController
  before_action :load_user, only: [:show, :edit, :update]
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_url(@user), notice: "#{@user.email} account created! Update your settings"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to user_url(@user), notice: "Settings updated!"
    else
      render :edit
    end
  end

  private
  def load_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end