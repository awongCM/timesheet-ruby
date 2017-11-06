class AddFieldsToEmployees < ActiveRecord::Migration[5.1]
  def change
    add_column :employees, :address, :string
    add_column :employees, :job_title, :string
    add_column :employees, :date_of_birth, :date
  end
end
