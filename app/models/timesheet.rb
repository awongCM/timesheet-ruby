class Timesheet < ApplicationRecord
    belongs_to :employee
    # TODOS
    scope :currently_logged_employee, ->(employee_id){ where(employee_id: employee_id) }
    # For reporting page
    scope :weekly_timesheets, -> { where(entry_date: Time.now.beginning_of_week(start_day = :sunday)..Time.now.end_of_week(start_day = :sunday) )}
end
