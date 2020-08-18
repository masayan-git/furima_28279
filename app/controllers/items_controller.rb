class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit,:update]
  before_action :move_to_session, only: [:edit,:new]

  def index
    @item = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
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
    move_to_session
  end
  
  def update
    if @item.update(item_params)
      redirect_to item_path(params[:id])
    else
      render :edit
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:sale_flags, :image, :price, :name, :overview, :category_id, :status_id, :delivery_fee_id, :area_id,	:shipping_id).merge(user_id: current_user.id)
  end

  def move_to_session
    unless user_signed_in?
      retirect_to new_user_session_path
    end
  end
end
