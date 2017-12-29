class Ability
  include CanCan::Ability

  # TODO - need to store and pass employee session id
  def initialize(user, session_employee_id)
    user ||= User.new

    if user.has_role? "admin"
      can :manage, :all
    elsif user.has_role? "supervisor"
      can :create, User
      can [:create, :read, :update], [Employee, Timesheet]
    elsif user.has_role? "user"
      can [:read, :update], Employee, :user_id => user.id
      can [:create, :read], Timesheet
      can :update, Timesheet, :employee_id => session_employee_id
      # TODO
      can [:create, :update], User, :user_id => user.id
    end
  end
end
