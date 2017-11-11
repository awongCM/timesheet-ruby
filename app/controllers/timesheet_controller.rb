class TimesheetController < ApplicationController
  def index
    
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
    # //TODOS
  end

  def create
    @timesheet = Timesheet.new(timesheet_params)
    @timesheet.save

    redirect_to timesheet_index_path
  end

  def update
    @timesheet = Timesheet.find(params[:id])
    
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
      params.require(:timesheet).permit(:title, :first_name, :last_name, :date_of_birth, :job_title, :address).merge(user_id: current_user.id)
  end


end