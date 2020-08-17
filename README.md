# README
# テーブル設計

## users テーブル

| Column              | Type      | Options                   |
| ------------------- | --------- | ------------------------- |
| nickname            | string    | null: false               |
| email               | string    | null: false, unique: true |
| password            | string    | null: false               |
| first_name          | string    | null: false               |
| last_name           | string    | null: false               |
| first_name_reading  | string    | null: false               |
| last_name_reading   | string    | null: false               |
| birthday            | date      | null: false               |


### Association

- has_many :items
- has_many :buyer



## items テーブル

| Column        | Type           | Options                        |
| ------------- | -------------- | ------------------------------ |
| user          | references     | null: false, foreign_key: true |
| image         | text           | null: false                    |
| price         | integer        | null: false                    |
| name          | string         | null: false                    |
| overview      | text           | null: false                    |
| buyer         | references     | null: false, foreign_key: true |
| category      | integer        | null: false                    |
| status        | integer        | null: false                    |
| delivery_fee  | integer        | null: false                    |
| area          | integer        | null: false                    |
| shipping      | integer        | null: false                    |
| sale_flag     | boolean        | null: false, default: false    |

### Association

- belongs_to :user
- has_one :buyer

## buyers テーブル

| Column            | Type        | Options                        |
| ----------------- | ----------- | ------------------------------ |
| user              | references  | null: false, foreign_key: true |
| item              | references  | null: false, foreign_key: true |

### Association

- has_one :buyer_address
- belongs_to :user
- belongs_to :item

## buyer_address

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefectures    | integer    | null: false                    |
| municipalities | string     | null: false                    |
| house_number   | string     | null: false                    |
| building       | string     |                                |
| phone_number   | string     | null: false                    |
| buyer          | references | null: false, foreign_key: true |

### Association

- belongs_to :buyer