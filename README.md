# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| name_reading       | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
## Association
has_many :items
has_many :buys


## items テーブル

| Column       | Type       | Options                         |
| -------------| ---------  | ------------------------------- |
| name         | string     | null: false                     |
| details      | text       | null: false                     |
| images       | string     | null: false                     |
| sell_user    | references | null: false,  foreign_key: true |
## Association
belongs_to :user
has_one :buy

## buy テーブル

| Column         | Type       | Options                        |
| ---------------| ---------- | ------------------------------ |
| buiyer_user    | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |
| adress         | references | null: false, foreign_key: true |
## Association
belongs_to :user
belongs_to :item
has_one :adress

## adress テーブル

| Column          | Type       | Options       |
| --------------- | ---------- | ------------- |
| postal_code     | string     | null: false,  |
| prefecture      | integer    | null: false,  |
| city            | string     | null: false,  |
| house_number    | string     | null: false,  |
| building_name   | string     | null: false,  |
## Association
belongs_to :buy