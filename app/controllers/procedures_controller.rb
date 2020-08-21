class ProceduresController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    redirect_to root_path if request.referer.nil?
    redirect_to new_user_session_path unless user_signed_in?
    @procedure = ProcedureAddress.new
  end

  def create
    @procedure = ProcedureAddress.new(order_params)
    if @procedure.valid?
      pay_item
      @procedure.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:procedure_address).permit(:postal_code, :area_id, :municipalities, :house_number, :building, :phone_number, :procedure_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end
end
