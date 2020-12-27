class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  

  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :days_ship
  belongs_to :category

  with_options presence: true do
    validates :item_name
    validates :description
  end

  with_options numericality: { other_than: 1,  message: 'を選択してください'} do
    validates :condition_id 
    validates :shipping_fee_id
    validates :prefecture_id
    validates :days_ship_id
    validates :category_id
  end
  

  validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'は300-9,999,999の範囲で入力してください'}

  validate :image_presence

  def image_presence
    unless image.attached?
      errors.add(:image, 'ファイルを選択してください')
    end
  end

  has_one_attached :image
  belongs_to :user

end
