# frozen_string_literal: true

class SessionsController < ApplicationController
  def index
    redirect_to user_path(current_user) if logged_in?
  end

  def new; end

  def create
    user = User.find_by(name: params[:name].downcase)
    if user
      log_in user
      redirect_to user_path(user)
    else
      byebug
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
