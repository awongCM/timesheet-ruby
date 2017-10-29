module ApplicationHelper

  #Checks current_user session has completed his employee profile
  def userHasEmployeeProfile(current_user)
    if !Employee.exists?(:user_id => current_user.id)
      return false
    else 
      return true
    end
  end
end
