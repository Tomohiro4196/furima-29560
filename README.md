# Tables

## Users Table

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| name   | string     | null: false                    |
| email  | string     | null: false                    |     

### Association
- has_many :item

## items Table

| Column       | Type    | Options                        |
| ------------ | ------- | ------------------------------ |
| item_name    | string  | null: false                    |
| price        | integer | null: false                    |
| user_id      | integer | null: false, foreign_key: true |
| sold_checked | boolean |                                |

### Association
- belongs_to        :user
- has_many_attached :item_photos
- has_one           :order

## orders Table

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| item_id    | references | null: false, foreign_key: true |
| buyer_id   | references | null: false, foreign_key: true |
| address_id | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- has_one    :address

## address

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| prefecture_id | references | null: false, foreign_key: true |
| city          | string     | null: false                    |
| town          | string     | null: false                    |
| block_number  | string     | null: false                    |
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