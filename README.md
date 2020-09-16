# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## client テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| name           | string  | null: false |
| name_kana      | string  | null: false |
| birth          | date    | null: false |
| picture        | text    |             |
| status_id      | integer | null: false |
| room_number    | integer |             |

### Association

- has_one :detail
- has_one :room


## details テーブル

| Column         | Type    | Options                        |
| -------------- | ------- | ------------------------------ |
| client_id      | integer | null: false, foreign_key: true |
| degree_id      | integer | null: false                    |
| past_history   | text    |                                |
| illness        | text    |                                |
| medicine       | text    |                                |
| mbp_high       | integer | null: false                    |
| mbp_low        | integer | null: false                    |
| move_id        | integer | null: false                    |
| move_exp       | text    |                                |
| meal_id        | integer | null: false                    |
| meal_exp       | text    |                                |
| excretion_id   | integer | null: false                    |
| excretion_exp  | text    |                                |
| oral_id        | integer | null: false                    |
| oral_exp       | text    |                                |

### Association

- belongs_to :client


## staff テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| name             | string  | null: false |
| name_kana        | string  | null: false |
| position_id      | integer | null: false |
| qualification_id | integer | null: false |
| work_style_id    | integer | null: false |
| picture          | text    |             |

### Association
- has_many :rooms, through: room_staff
- has_many :room_staff
- has_many :messages


## rooms テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| client_id | integer    | null: false, foreign_key: true |

### Association
- belongs_to :client
- has_many :staff, through: room_staff
- has_many :room_staff
- has_many :messages


## room_staff テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| room_id   | integer    | null: false, foreign_key: true |
| staff_id  | integer    | null: false  foreign_key: true |

### Association
- belongs_to :room
- belongs_to :staff


## messages テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| staff_id  | integer    | null: false, foreign_key: true |
| room_id   | integer    | null: false  foreign_key: true |
| content   | text       | null: false                    |
| picture   | text       |                                |

### Association
- belongs_to :room
- belongs_to :staff
