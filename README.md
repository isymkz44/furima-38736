# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| name_reading       | string | null: false |
| nick_name          | string | null: false |
| email              | string | null: false |
| birthday           | string | null: false |
| adress             | string | null: false |
| encrypted_password | string | null: false |
## Association
has_many :items
has_many :buys


## items テーブル

| Column          | Type       | Options                         |
| --------------- | ---------  | ------------------------------- |
| name            | string     | null: false                     |
| details         | text       | null: false                     |
| images          | string     | null: false                     |
| price           | string     | null: false                     |
| category        | string     | null: false                     |
| condition       | string     | null: false                     |
| status          | string     | null: false                     |
| shipping_date   | string     | null: false                     |
| shipping_charge | string     | null: false                     |
| sell_user       | references | null: false,  foreign_key: true |

## Association
belongs_to :user
has_one :buy

## buy テーブル

| Column         | Type       | Options                        |
| ---------------| ---------- | ------------------------------ |
| users_name     | references | null: false, foreign_key: true |
| items_name     | references | null: false, foreign_key: true |
## Association
belongs_to :user
belongs_to :item
has_one :adress

## adress テーブル

| Column          | Type       | Options      |
| --------------- | ---------- | ------------ |
| postal_code     | string     | null: false  |
| prefecture      | integer    | null: false  |
| city            | string     | null: false  |
| house_number    | string     | null: false  |
| building_name   | string     |              |
| phone_number    | string     | null: false  |
## Association
belongs_to :buy