class Employee < ApplicationRecord
    has_one :user

    has_many :timesheets
end
