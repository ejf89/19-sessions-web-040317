class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params['username'])
    if user.present?
      session[:user_id] = user.id
      redirect_to students_path
    else
      flash[:notice] = "The username you provided did not match our records. Please double check and try again."
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end

end
