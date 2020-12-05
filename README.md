# Tables

## Users Table

| Column             | Type       | Options                   |
| ------------------ | ---------- | ------------------------- |
| nickname           | string     | null: false               |
| email              | string     | null: false, unique: true | 
| phone_number       | integer    | null: false, unique: true |
| encrypted_password | string     | null: false               |
| birthday           | date       | null: false               |
| family_name        | string     | null: false               | 
| first_name         | string     | null: false               |
| family_kana        | string     | null: false               |
| first_kana         | string     | null: false               |

### Association
- has_many :items
- has_many :orders

## items Table

| Column          | Type    | Options                        |
| --------------- | ------- | ------------------------------ |
| item_name       | string  | null: false                    |
| price           | integer | null: false                    |
| user_id         | integer | null: false, foreign_key: true |
| condition_id    | integer | null: false, foreign_key: true |
| shipping_fee_id | integer | null: false, foreign_key: true |
| prefecture_id   | integer | null: false, foreign_key: true |
| days_ship_id    | integer | null: false, foreign_key: true |
| category_id     | integer | null: false, foreign_key: true |

### Association
- belongs_to        :user
- has_many_attached :item_photos
- has_one           :order

## orders Table

| Column     | Type    | Options                        |
| ---------- | ------- | ------------------------------ |
| item_id    | integer | null: false, foreign_key: true |
| user_id    | integer | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one    :address

## address

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| order_id      | references | null: false, foreign_key: true |
| prefecture_id | references | null: false, foreign_key: true |
| city          | string     | null: false                    |
| town_block    | string     | null: false                    |
| building_name | string     |                                |
| zip_code      | string     | null: false                    |

### API
  extend ActiveHash::Associations::ActiveRecordExtensions

### Association
- belongs_to :order

