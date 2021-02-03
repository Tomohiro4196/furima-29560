class OrderAddress
  include ActiveModel::Model
  attr_accessor :phone_number, :prefecture_id, :city, :town_block, :building_name, :zip_code, :item_id, :buyer_id, :token

  with_options presence: true do
    validates :phone_number, format: { with: /\A[0-9]{11}\z/, message: 'is not valid' }
    validates :city
    validates :town_block
    validates :zip_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :token
  end

  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    # @order_addressとして作った情報を振り分ける
    order = Order.create(item_id: item_id, buyer_id: buyer_id)
    # @order_addressから持ってくるのでコントローラーに記載したカラム名を参照する
    Address.create(order_id: order.id, phone_number: phone_number, prefecture_id: prefecture_id, city: city, town_block: town_block, building_name: building_name, zip_code: zip_code)
  end
end
