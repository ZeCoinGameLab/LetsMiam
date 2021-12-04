class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
    session[:return_to] ||= request.referer
  end

  def require_user_logged_in!
    redirect_to sign_in_path, alert: 'Vous devez être connecté(e)' if Current.user.nil?
  end
end
