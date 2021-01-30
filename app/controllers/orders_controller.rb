class OrdersController < ApplicationController

  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
    #indexページでインスタンスを作成するからnewメソッドには入力しない
  end

  def create
      @item = Item.find(params[:item_id])
      #renderで戻る時用のインスタンス
      @order_address = OrderAddress.new(order_address_params)
      if @order_address.valid?
        @order_address.save
        #order_address.rbのモデル内にsaveメソッドを記載。
        #rubyはコントローラーはスリムに見せるようにするのが原則
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

end
