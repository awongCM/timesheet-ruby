module ApplicationHelper

  #TODO - Checks current_user session has completed his employee profile
  def userHasEmployeeProfile
    if !Employee.exists?(:user_id => current_user.id)
      return false
    else 
      return true
    end
  end
  
end
