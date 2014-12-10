class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'You have been registered successfully.  Please sign in.'
      redirect_to sign_in_path
    else
      flash[:error] = 'Could not complete registration successfully.'
      render new
    end
  end

  def show
    @user = User.find(params[:id])
  end

private
  def user_params
    params.require(:user).permit!
  end
end
