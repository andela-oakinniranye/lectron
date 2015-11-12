class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :check_if_user_has_complete_profile
  helper_method :current_user
  # before_action :check_if_user_has_complete_profile


  private
    def check_if_user_has_complete_profile
      if current_user
         current_user.is_profile_not_complete?
      end
    end

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

end
