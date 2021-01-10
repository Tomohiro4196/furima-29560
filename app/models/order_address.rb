# class OrderAddress
#   include ActiveModel::Model
#   attr_accessor :phone_number, :prefecture_id, :city, :town_block, :building_name, :zip_code

#   with_options presence: true do
#     validates :phone_number, {with: /\A[0-9]{3}\z/, message:'is not valid'}
#     validates :city
#     validates :town_block
#     validates :building_name
#     validates :zip_code, { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
#   end

#   validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

#   def save
#     order = Order.create(item_id: item.id, user_id: user.id)
#     Address.create(order_id: order.id, phone_number: phone_number, prefecture_id: prefecture_id, city: city, town_block: town_block, building_name: building_name, zip_code: zip_code )
#   end

# end
