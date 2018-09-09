class UsersController < ApplicationController
  before_action :load_user, only: [:show, :edit, :update]
  skip_before_action :authorize, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_url(@user), notice: "Welcome! Account created for #{@user.email}"
    else
      render :new
    end
  end

  def show
    @attendance = Attendance.new
    # Only load today's attendance data of @user
    @attendances = @user.attendances.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
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
    @user = User.find(params[:id] || current_user.id)
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
