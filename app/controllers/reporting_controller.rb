class ReportingController < ApplicationController
  #TODO
  def index
    # query the weekly timesheets data submitted by currently signed in employee

    # using employee_id session
    # TODO - to restore weekly_timesheets scope
    # @timesheets = Timesheet.currently_logged_employee(@session_employee_id).weekly_timesheets.order(:entry_date)
    @timesheets = Timesheet.currently_logged_employee(@session_employee_id).order(:entry_date)
    
    @title = 'Your timesheets submitted this week'

    # humanize entry date field
    @entry_dates = @timesheets.pluck(:entry_date).map{ |ed| ed.strftime("%d/%m/%Y")}

    # total hours data
    @total_hours = @timesheets.pluck(:total_hours)
    @total_hours_legend = 'Total Hours worked'

    @data_hash = {labels: @entry_dates, data: @total_hours, legend: @total_hours_legend, title: @title }
  end

end