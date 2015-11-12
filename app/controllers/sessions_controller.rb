class SessionsController < ApplicationController
  def new
  end

  def sso_auth
    user = User.from_omniauth(env["omniauth.auth"], current_user)
    redirect_after_logging_in(user) and return
  end


  def login
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      redirect_after_logging_in(user) and return
    else
      flash[:login_errors] = "Your password and username don't match"
      render :new
    end
  end


  def logout
    reset_session
    redirect_to root_path
  end

  private
    def redirect_after_logging_in(user)
      session[:user_id] = user.id
      if env['omniauth.origin'] || session[:redirect_url]
        redirect_to env['omniauth.origin'] || session[:redirect_url]
      else
        redirect_to root_url
      end
    end

    def login_params
      params.permit(:email, :password)
    end
end
