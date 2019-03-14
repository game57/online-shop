class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params.require(:email))
    if user && user.authenticate(params.require(:password))
      session[:user_id] = user.id
      redirect_to root_url, notice: "Successfully signed in."
    else
      redirect_to sign_in_url, alert: "Sign in failed. Please confirm your email and password."
    end
  end

  def destroy
    raise NotImplementedError, "TODO"
  end
end
