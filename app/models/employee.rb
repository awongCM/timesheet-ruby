class Employee < ApplicationRecord
    # TODO
    has_one :user

    has_many :timesheets
end
