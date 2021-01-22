class ItemsController < ApplicationController
  
  before_action :set_item, only: [:show, :edit, :update]
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :check_user, only: [:edit]
 

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
   
  end

  def edit
   
  end

  def update
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

  def set_item
    @item = Item.find(params[:id])
  end 

  def check_user
    if current_user.id != @item.user_id
      redirect_to root_path
    end
  end
end
