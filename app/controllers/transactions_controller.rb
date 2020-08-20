class TransactionsController < ApplicationController

  def index
    @transaction = TransactionOrderer.new
    @item = Item.find(params[:item_id])
  end

  def create
    @transaction = TransactionOrderer.new(order_params)
    if @transaction.valid?
      pay_item
      @transaction.save
      return redirect_to root_path
    else
      render 'index'
    end
  end
  
  private

  def order_params
    params.require(:transaction_orderer).permit(:postal_code, :area_id, :municipalities, :house_number,:building,:phone_number,:transaction_id).merge(user_id: current_user.id,item_id: params[:item_id])
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = "sk_test_aec35a361f8c8f97c638ba17"
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency:'jpy'
    )
  end
end
