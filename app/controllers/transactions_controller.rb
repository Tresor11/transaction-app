class TransactionsController < ApplicationController
  def index
    @transactions = current_user.transactions.includes(:group, :author)
      .where.not(group_id: [nil]).order(created_at: :desc)
    @sum = @transactions.sum('amount')
  end

  def new
    @transaction = current_user.transactions.build
  end

  def edit
    @transaction = current_user.transactions.find(params[:id])
  end

  def create
    @transaction = current_user.transactions.build(transaction_params)
    @transaction.author_id = current_user.id
    if @transaction.save!
      flash[:notice] = 'transaction saved'
      redirect_to transactions_path
    else
      flash.now[:danger] = 'please fill in all required fields'
      render :new
    end
  end

  def update
    @transaction = current_user.transactions.find(params[:id])
    if @transaction.update(transaction_params)
      flash[:notice] = 'Transaction updated'
      redirect_to transactions_path
    else
      flash.now[:danger] = 'please fill in all the required fields'
      render :edit
    end
  end

  def external
    @externals = current_user.transactions.where(group: nil).order(created_at: :desc)
    @sum = @externals.sum('amount')
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def destroy
    @transaction = current_user.transactions.find(params[:id])
    @transaction.destroy
    # redirect_to the last page
    redirect_to request.referrer
  end

  private

  def transaction_params
    params.require(:transaction).permit(:name, :amount, :group_id)
  end
end
