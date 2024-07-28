# README

# テーブル設計

## users テーブル

| Column                     | Type       | Options     |
| -------------------------- | ---------- | ----------- |
| nickname                   | string     | null: false |
| email                      | string     | null: false, unique:true |
| encrypted_password         | string     | null: false |
| family_name_kanji          | string     | null: false |
| first_name_kanji           | string     | null: false |
| family_name_kana           | string     | null: false |
| first_name_kana            | string     | null: false |
| birthday                   | integer    | null: false |

### Association
- has_many :items
- has_many :orders

## items テーブル

| Column       | Type        | Options     |
| ------------ | ----------- | ----------- |
| item_name    | string      | null: false |
| item_text    | text        | null: false |
| category     | string      | null: false |
| condition    | string      | null: false |
| charges      | string      | null: false |
| area         | string      | null: false |
| days         | string      | null: false |
| price        | integer     | null: false |
| user_id      | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order


## orders テーブル

| Column         | Type        | Options                        |
| -------------- | ----------- | ------------------------------ |
| user_id        | references  | null: false, foreign_key: true |
| item_id        | references  | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one :purchaser


## purchasers テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | integer    | null: false |
| todoufukenn    | string     | null: false |
| city           | string     | null: false |
| street_address | string     | null: false |
| building_name  | string     | 
| phone_number   | integer    | null: false |
| order_id       | references | null: false, foreign_key: true |

### Association
- belongs_to :order
