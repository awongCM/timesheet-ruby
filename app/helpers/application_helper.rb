module ApplicationHelper

  #TODO - Checks current_user session has completed his employee profile
  def userHasEmployeeProfile
    if !Employee.exists?(:user_id => current_user.id)
      return false
    else 
      return true
    end
  end

  def global_format_datetime(time, timezone)
    time = time.to_time
    content_tag(:span, I18n.l(time, format: '%A, %d-%b-%Y - %T %p'), data: {timezone: timezone, time: time.iso8601})
  end
  
end
