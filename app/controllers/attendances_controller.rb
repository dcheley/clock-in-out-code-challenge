class AttendancesController < ApplicationController
  before_action :load_attendance_data, only: [:update, :destroy]

  def create
    @attendance = Attendance.new(attendance_params)
    @user = @attendance.user
    respond_to do |format|
      if @attendance.save
        format.html { redirect_to user_url(@user), notice: "Time successfully logged" }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render "users/show" }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @attendance = Attendance.find(params[:id])
  end

  def update
    if @attendance.update_attributes(attendance_params)
      redirect_to attendances_url, notice: "Attendance info updated"
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      @attendance.destroy
      format.html { redirect_to attendances_url, notice: "Attendance info deleted" }
      format.json { render json: @user, status: :created, location: @user }
    end
  end

  def index
    @attendances = Attendance.where(user_id: current_user.id).order("created_at ASC")
  end

  private
  def load_attendance_data
    @attendance = Attendance.find(params[:id])
    @user = @attendance.user
  end

  def attendance_params
    params.require(:attendance).permit(:status, :user_id, :created_at)
  end
end
