class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def items_params
    params.require(:item).permit(:image, :item_name, :price, :description, :condition_id, :shipping_fee_id, :prefecture_id, :days_ship_id, :category_id).merge(user_id: current_user.id)
  end
end
