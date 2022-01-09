class UsersController < ApplicationController

  def show; end

  def external; end

  def welcome
    redirect_to current_user if signed_in?
  end
end
