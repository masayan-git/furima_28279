class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update]
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

  def edit
    redirect_to root_path if current_user.id != @item.user.id
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    if current_user.id == item.user.id
      item.destroy
    else
      redirect_to root_path
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
