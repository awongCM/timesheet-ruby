class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.has_role? "admin"
      can :manage, :all
    elsif user.has_role? "supervisor"
      can :create, User
      can [:create, :read, :update], [Employee, Timesheet]
    elsif user.has_role? "user"
      can [:read, :update], Employee, :user_id => user.id
      can [:create, :read], Timesheet, :employee_id => @session_employee_id
      # TODO
      can [:create, :update], User, :user_id => user.id
    end
  end
end
