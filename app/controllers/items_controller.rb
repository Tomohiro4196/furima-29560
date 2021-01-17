class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.all.order('created_at DESC')
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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(items_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def items_params
    params.require(:item).permit(:image, :item_name, :price, :description, :condition_id, :shipping_fee_id, :prefecture_id, :days_ship_id, :category_id).merge(user_id: current_user.id)
  end
end
