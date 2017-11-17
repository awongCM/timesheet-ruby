class TimesheetController < ApplicationController
  def index
    @employee_id = Employee.find_by(user_id: current_user.id).id
    @timesheets = Timesheet.where(employee_id: @employee_id )
  end

  def new
    @timesheet = Timesheet.new
    @timesheet_url_path = timesheet_index_path
  end

  def edit
    @timesheet = Timesheet.find(params[:id])
    @timesheet_url_path = timesheet_path
  end

  def show
    @timesheet = Timesheet.find(params[:id])
  end

  def create
    # fetch employee id
    @employee_id = Employee.find_by(user_id: current_user.id).id
    @timesheet = Timesheet.new(timesheet_params)
    @timesheet.save

    redirect_to timesheet_index_path
  end

  def update
    @timesheet = Timesheet.find(params[:id])
    # save current employee_id
    @employee_id = @timesheet.employee_id
    
    if @timesheet.update(timesheet_params)
        redirect_to timesheet_index_path
    else
        render 'edit'
    end

  end

  def destroy
    @timesheet = Timesheet.find(params[:id])
    @timesheet.destroy

    redirect_to timesheet_index_path
  end

  # TODOS
  private
  def timesheet_params
      params.require(:timesheet).permit(:title, :description, :entry_date, :total_hours, :status).merge(employee_id: @employee_id)
  end


end