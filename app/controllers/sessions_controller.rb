class SessionsController < ApplicationController
  def new
    redirect_to root_path if current_user
  end

  def create
    user = User.where(email: params[:email]).first
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Your are signed in!'
    else
      flash[:error] = 'Invalid credentials'
      redirect_to sign_in_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to sign_in_path, notice: 'You are signed out!'
  end
end
