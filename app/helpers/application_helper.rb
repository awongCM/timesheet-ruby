module ApplicationHelper

  def userHasEmployeeProfile
    return session[:employee_id] != nil ? true : false
  end

  def global_format_datetime(time, timezone)
    time = time.to_time
    content_tag(:span, I18n.l(time, format: '%A, %d/%b/%Y - %T %p'), data: {timezone: timezone, time: time.iso8601})
  end
  
end
