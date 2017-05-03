class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params['username'])
    if user.present?
      session[:user_id] = user.id
      redirect_to students_path
    else
      redirect_to login_path
    end
  end

end
