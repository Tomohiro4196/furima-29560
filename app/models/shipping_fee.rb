class ShippingFee < ActiveHash::Base
  self.data = [
    {id: 1, paid_by: '---'},
    {id: 2, paid_by: '着払い（購入者負担）'},
    {id: 3, paid_by: '送料込み（出品者負担）'},
  ]

  include ActiveHash::Associations
  has_many :items
end
