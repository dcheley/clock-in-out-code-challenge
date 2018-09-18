class AttendancesController < ApplicationController
  before_action :load_attendance_data, only: [:update, :destroy]
  before_action :load_weekly_data, only: [:create, :update]

  def create
    @attendance = Attendance.new(attendance_params)
    respond_to do |format|
      if @attendance.save
        @attendance.update_attributes(date_created: @attendance.created_at.to_date)
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
      @attendance.update_attributes(date_created: @attendance.created_at.to_date)
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

  def load_weekly_data
    @user = current_user
    @attendances = @user.attendances.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
    # Pull this week's dates into array for view
    today = Date.today
    @days_this_week = (today.at_beginning_of_week..today.at_end_of_week).map
    @weekly_attendance = @user.attendances.where(created_at: today.at_beginning_of_week..today.at_end_of_week)
  end

  def attendance_params
    params.require(:attendance).permit(:status, :user_id, :created_at, :date_created)
  end
end
