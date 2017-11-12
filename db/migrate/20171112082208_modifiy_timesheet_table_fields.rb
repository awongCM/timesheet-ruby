class ModifiyTimesheetTableFields < ActiveRecord::Migration[5.1]
  def change
    rename_column :timesheets, :name, :title
    add_column :timesheets, :status, :string
  end
end
