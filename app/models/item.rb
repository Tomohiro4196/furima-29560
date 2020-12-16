class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :days_ship
  belongs_to :category

end
