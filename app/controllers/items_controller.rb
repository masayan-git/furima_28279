class ItemsController < ApplicationController
  def index
    @item = Item.all
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

  private

  def item_params
    params.require(:item).permit(:sale_flags, :image, :price, :name, :overview, :category, :status, :delivery_fee, :area,	:shipping).merge(user_id: current_user.id)
  end
end
