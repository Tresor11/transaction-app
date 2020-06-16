class SessionsController < ApplicationController
  def index
    redirect_to user_path(current_user) if logged_in?
  end

  def new; end

  def create
    user = User.find_by(name: params[:name].downcase)
    if user
      log_in user
      flash[:notice] = "welcome #{user.name}"
      redirect_to user_path(user)
    else
      flash.now[:danger] = 'Invalid User name'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
