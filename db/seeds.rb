# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'csv'

# Method to read loaded CVS when seeding data
def load_csv(csv_path)
  csv_source = File.read(Rails.root.join(csv_path))
  CSV.parse(csv_source, headers: true, encoding: 'ISO-8859-1')
end

users_data = load_csv('db/seeds/users.csv')

users_data.each do |row|
  User.create! do |user|
    user.username = row['username']
    user.email = row['email']
    user.password = row['password']
    user.password_confirmation = row['password_confirmation']
  end  
end

puts "There are now #{User.count} rows in the User table"

employees_data = load_csv('db/seeds/employees.csv')

employees_data.each do |row|
  Employee.create! do |employee|
    employee.title = row['title']
    employee.first_name = row['first_name']
    employee.last_name = row['last_name']
    employee.address = row['address']
    employee.job_title = row['job_title']
    employee.gender = row['gender']
    employee.date_of_birth = Date.parse(row['date_of_birth']).to_s
    user = User.find_by(username: row['username'])
    employee.user_id = user.id
  end  
end

puts "There are now #{Employee.count} rows in the Employee table"

timesheets_data = load_csv('db/seeds/timesheets.csv')

timesheets_data.each do |row|
  Timesheet.create! do |timesheet|
    timesheet.title = row['title']
    timesheet.description = row['description']
    timesheet.entry_date = DateTime.parse(row['entry_date']).to_s
    timesheet.total_hours = row['total_hours']
    timesheet.status = row['status']
    # ensure that username is unique field in the db
    user = User.find_by(username: row['username'])
    employee = Employee.find_by(user_id: user.id)
    timesheet.employee_id = employee.id
  end  
end

puts "There are now #{Timesheet.count} rows in the Timesheet table"