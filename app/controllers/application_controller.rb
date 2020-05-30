class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?
  helper_method :going?

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def going?(event_id)
    return false if !current_user || current_user.attended_events.where(id: event_id).empty?

    true
  end
end
