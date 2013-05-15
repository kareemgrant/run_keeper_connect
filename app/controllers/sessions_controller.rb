class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    if user
      session[:user_id] = user.id
      redirect_to root_url, notice: "Signed in!"
    else
      render :new, alert: "Authentication failed"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out!"
  end
end
