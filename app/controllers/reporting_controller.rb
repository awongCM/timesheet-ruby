class ReportingController < ApplicationController
  #TODO
  def index
    # query the timesheets data submitted by currently signed in employee

    @employee_id = Employee.find_by(user_id: current_user.id).id
    @timesheets = Timesheet.where(employee_id: @employee_id).select(:total_hours, :entry_date).order(:entry_date)

    @title = 'Timesheets submitted this week'

    # humanize entry date field
    @entry_dates = @timesheets.pluck(:entry_date).map{ |ed| ed.strftime("%d/%m/%Y")}

    # total hours data
    @total_hours = @timesheets.pluck(:total_hours)
    @total_hours_legend = 'Total Hours worked'

    @data_hash = {labels: @entry_dates, data: @total_hours, legend: @total_hours_legend, title: @title }
  end

end