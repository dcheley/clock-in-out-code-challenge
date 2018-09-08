class AttendancesController < ApplicationController
  before_action :load_attendance_data only: [:update, :destroy]

  def create
    @attendance = Attendance.new(attendance_params)
    @user = @attendance.user
    respond_to do |format|
      if @attendance.save
        format.html { redirect_to user_url(@user), notice: "Time successfully logged" }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render user_url(@user) }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @attendance.update_attributes(attendance_params)
        format.html { redirect_to user_url(@user), notice: "Attendance updated" }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render user_url(@user) }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      @attendance.destroy
      format.html { redirect_to user_url(@user), notice: "Attendance data deleted" }
      format.json { render json: @user, status: :created, location: @user }
    end
  end

  def index
    @attendances = Attendance.all.order("created_at DESC")
  end
  
  private
  def load_attendance_data
    @attendance = Attendance.find(params[:id])
    @user = @attendance.user
  end

  def attendance_params
    params.require(:attendance).permit(:start_time, :end_time, :user_id)
  end
end
