# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# TODO - simplest approach seeding data for tables with simpel relationships for now
# next idea is to use actual csv data import rather than just plain ruby code

5.times do |i|
  user = User.create!(username: "username_0#{i}", email: "username_0#{i}@example.com", password: "username_0#{i}_pwd567" , password_confirmation: "username_0#{i}_pwd567")
  employee = Employee.create!(title: "Mr", first_name: "User", last_name: "Name_0#{i}", user_id: user.id)
  20.times do |j|
    Timesheet.create(title: "Timesheet_#{j}", description:"timesheet_done_by_username_0#{i}",  total_hours: rand(2..15) , entry_date: rand(Time.now.beginning_of_week.to_date..Time.now.end_of_week.to_date), employee_id: employee.id)
  end
end
