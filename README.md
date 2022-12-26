# テーブル設計

## users テーブル

| Column             | Type   | Options                        |
| ------------------ | ------ | ------------------------------ |
| first_name         | string | null: false                    |
| last_name          | string | null: false                    |
| first_name_reading | string | null: false                    |
| last_name_reading  | string | null: false                    |
| nickname           | string | null: false                    |
| email              | string | null: false, unique: true      |
| birthday           | date   | null: false                    |
| encrypted_password | string | null: false                    |
## Association
has_many :items
has_many :buys


## items テーブル

| Column             | Type        | Options                         |
| ------------------ | ----------  | ------------------------------- |
| name               | string      | null: false                     |
| description        | text        | null: false                     |
| price              | integer     | null: false                     |
| category_id        | integer     | null: false                     |
| condition_id       | integer     | null: false                     |
| shipping_date_id   | integer     | null: false                     |
| shipping_charge_id | integer     | null: false                     |
| prefecture_id      | integer     | null: false                     |
| user               | references  | null: false,  foreign_key: true |

## Association
belongs_to :user
has_one :buy
belongs_to_active_hash :category
belongs_to_active_hash :condition
belongs_to_active_hash :shipping_date
belongs_to_active_hash :shipping_charge
belongs_to_active_hash :prefecture

## buys テーブル

| Column         | Type       | Options                        |
| ---------------| ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |
## Association
belongs_to :user
belongs_to :item
has_one :address

## addresses テーブル

| Column          | Type       | Options                       |
| --------------- | ---------- | ----------------------------- |
| postal_code     | string     | null: false                   |
| prefecture_id   | integer    | null: false                   |
| city            | string     | null: false                   |
| house_number    | string     | null: false                   |
| building_name   | string     |                               |
| phone_number    | string     | null: false                   |
| buy             | references    | null: false,foreign_key: true |
## Association
belongs_to :buy
belongs_to_active_hash :prefecture