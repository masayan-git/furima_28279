class ItemsController < ApplicationController
  before_action :set_item, only: [:show]
  def index
    @item = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
    redirect_to new_user_session_path unless user_signed_in?
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:sale_flags, :image, :price, :name, :overview, :category_id, :status_id, :delivery_fee_id, :area_id,	:shipping_id).merge(user_id: current_user.id)
  end
end
