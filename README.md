# Tables

## Users Table

| Column      | Type       | Options                                                                                             |
| ----------- | ---------- | ------------------------------------------------------------------------------------------------- - |
| nickname    | string     | null: false                                                                                         |
| email       | string     | null: false                                                                                         |    
| birthday    | integer    | null: false                                                                                         |
| family_name | string     | null: false                                                                                         | 
| first_name  | string     | null: false                                                                                         |
| family_kana | string     | null: false |
| first_kana  | string     | null: false |

### Association
- has_many :item

## items Table

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item_name     | string     | null: false                    |
| price         | integer    | null: false                    |
| user_id       | integer    | null: false, foreign_key: true |
| sold_checked  | boolean    |                                |
| condition_id  | references | null: false, foreign_key: true |
| delivery_fee  | boolean    | null: false                    |
| prefecture_id | references | null: false                    |
| days_ship_id  | references | null: false                    |
| category_id   | references | null: false, foreign_key: true |

### Association
- belongs_to        :user
- has_many_attached :item_photos
- has_one           :order
- belongs_to        :prefecture
- belongs_to        :days_ship
- belongs_to        :category

## orders Table

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| item_id    | references | null: false, foreign_key: true |
| buyer_id   | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- has_one    :address

## address

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| order_id      | references | null: false, foreign_key: true |
| prefecture_id | references | null: false, foreign_key: true |
| city          | string     | null: false                    |
| town          | string     | null: false                    |
| block_number  | string     | null: false                    |
| building_name | string     |                                |
| zip_code      | integer    | null: false                    |

### API
  extend ActiveHash::Associations::ActiveRecordExtensions

### Association
- belongs_to :order
- belongs_to :prefecture

## Prefecture < ActiveHash::Base

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| id     | integer    |                                |
| name   | string     |                                |

### API
  include ActiveHash::Associations

### Association
- has_one :address
- has_one :item