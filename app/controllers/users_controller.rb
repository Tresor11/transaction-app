class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_param)
    if @user.save
      log_in @user
      flash[:notice] = "welcome#{@user.name}"
      redirect_to @user
    else
      flash.now[:danger] = 'Invalid User name'
      render :new
    end
  end

  def show
    @user = current_user
  end

  def index
    @my_transaction = current_user.transactions.all
  end

  def external; end

  private

  def user_param
    params.require(:user).permit(:name)
  end
end
