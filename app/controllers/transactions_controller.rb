class TransactionsController < ApplicationController
  def index
    @sum = current_user.transactions.where.not(group_id: [nil]).sum('amount')
    @transactions = current_user.transactions.includes(:group).where.not(group_id: [nil]).order(created_at: :desc)
  end

  def new
    @transaction = current_user.transactions.build
  end

  def create
    @transaction = current_user.transactions.build(transaction_params)
    @transaction.author_id = current_user.id
    if @transaction.save
      flash[:notice] = 'transaction saved'
      redirect_to transactions_path
    else
      flash.now[:danger] = 'please fill in all the informations'
      render :new
    end
  end

  def external
    @external = current_user.transactions.where(group: nil).order(created_at: :desc)
    @sum = current_user.transactions.where(group: nil).sum('amount')
  end

  def show
    @transaction = Purchase.find(params[:id])
  end

  private

  def transaction_params
    params.require(:transaction).permit(:name, :amount, :group_id)
  end
end
