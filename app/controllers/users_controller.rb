class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def index
    @my_transaction = current_user.transactions.all
  end

  def external; end

  def welcome
  redirect_to current_user if current_user
  end
end
