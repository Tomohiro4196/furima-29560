class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_setting, only: [:index, :create]

  def index
     if current_user.id == @item.user_id || @item.order != nil
      redirect_to root_path
     end 
    @order_address = OrderAddress.new
    # indexページでインスタンスを作成するからnewメソッドには入力しない
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
    # インスタンスの作成
    if @order_address.valid?
      payment
      @order_address.save
      # order_address.rbのモデル内にsaveメソッドを記載。
      # rubyはコントローラーはスリムに見せるようにするのが原則
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_address_params
    params.require(:order_address).permit(:phone_number, :prefecture_id, :city, :town_block, :building_name, :zip_code).merge(item_id: params[:item_id], buyer_id: current_user.id, token: params[:token])
    # paramsに付随しているitem_idを取得するためにitem_id; params[:item_id]という風に記載している
  end

  def item_setting
    @item = Item.find(params[:item_id])
  end

  def payment
    Payjp.api_key = ENV['FURIMA_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_address_params[:token],
      currency: 'jpy'
    )
  end
end
