# README
# テーブル設計

## users テーブル

| Column     | Type   | Options                   |
| ---------- | ------ | ------------------------- |
| nickname   | string | null: false               |
| email      | string | null: false, unique: true |
| password   | string | null: false               |
| first_name | string | null: false               |
| last_name  | string | null: false               |
| birthday   | string | null: false               |

### Association

- has_many :items
- has_one :buyer



## items テーブル

| Column        | Type    | Options                        |
| ------------- | ------- | ------------------------------ |
| user          | integer | null: false, foreign_key: true |
| category      | string  | null: false                    |
| status        | string  | null: false                    |
| delivery_fee  | string  | null: false                    |
| area          | string  | null: false                    |
| shipping      | string  | null: false                    |
| item_image    | text    | null: false                    |
| item_price    | integer | null: false                    |
| item_name     | string  | null: false                    |
| item_overview | string  | null: false                    |
| buyer         | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buyer

## buyers テーブル

| Column            | Type     | Options                        |
| ----------------- | -------  | ------------------------------ |
| user              | integer  | null: false, foreign_key: true |
| item              | integer  | null: false, foreign_key: true |
| buyer_address     | integer  | null: false, foreign_key: true |

### Association

- has_one :buyer_address
- belongs_to :user
- belongs_to :item

## buyer_address

| Column         | Type    | Options                        |
| -------------- | ------- | ------------------------------ |
| postal_code    | integer | null: false                    |
| prefectures    | string  | null: false                    |
| municipalities | string  | null: false                    |
| house_number   | string  | null: false                    |
| building       | string  | null: false                    |
| phone_number   | integer | null: false                    |
| buyer          | integer | null: false, foreign_key: true |

### Association

- belongs_to :buyer