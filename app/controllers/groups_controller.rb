class GroupsController < ApplicationController
  def index
    @groups = Group.all.order(created_at: :desc)
  end

  def new
    @group = current_user.groups.build
  end

  def show
    @group = Group.find(params[:id])
    @transactions = @group.transactions.includes(:author)
    @sum = @group.transactions.sum('amount')
  end

  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      flash[:notice] = 'Group created'
      redirect_to @group
    else
      flash.now[:danger] = 'please fill in all the required fields'
      render :new
    end
  end

  def edit
    @group = current_user.groups.find(params[:id])
  end

  def update
    if @group.update(group_params)
      flash[:notice] = 'Group updated'
      redirect_to @group
    else
      flash.now[:danger] = 'please fill in all the required fields'
      render :edit
    end
  end

  def destroy
    @group.destroy
    flash[:notice] = 'Group deleted'
    redirect_to groups_path
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon, :icon_cache, :creator_id)
  end
end
