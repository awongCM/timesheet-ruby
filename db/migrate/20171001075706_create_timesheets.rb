class CreateTimesheets < ActiveRecord::Migration[5.1]
  def change
    create_table :timesheets do |t|
      t.string :name
      t.string :description
      t.datetime :entry_date
      t.integer :total_hours
      t.references :employee

      t.timestamps
    end
  end
end
