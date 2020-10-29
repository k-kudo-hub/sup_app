### client テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| name           | string  | null: false |
| name_kana      | string  | null: false |
| birth          | date    | null: false |
| room_number    | integer | null: false |
| picture        | text    |             |
| status_id      | integer | null: false |
| careplan       | text    |             |
| sex_id         | integer | null: false |
| insurance      | integer |             |


#### Association

- has_one :detail
- has_one :care
- has_one :room
- has_many :relationships
- has_many :users, through: :relationships
- has_many :records
- has_many :reports


###  detail テーブル

| Column         | Type    | Options                        |
| -------------- | ------- | ------------------------------ |
| client_id      | integer | null: false, foreign_key: true |
| past_history   | text    |                                |
| illness        | text    |                                |
| medicine       | text    |                                |
| doctor         | text    |                                |
| mbp_high       | integer | null: false                    |
| mbp_low        | integer | null: false                    |


#### Association

- belongs_to :client


###  caregiver テーブル

| Column         | Type    | Options                        |
| -------------- | ------- | ------------------------------ |
| client_id      | integer | null: false, foreign_key: true |
| degree_id      | integer | null: false                    |
| cognition_id   | integer | null: false                    |
| move_id        | integer | null: false                    |
| move_exp       | text    |                                |
| meal_id        | integer | null: false                    |
| meal_exp       | text    |                                |
| excretion_id   | integer | null: false                    |
| excretion_exp  | text    |                                |
| oral_id        | integer | null: false                    |
| oral_exp       | text    |                                |
| bathing_id     | integer | null: false                    |
| bathing_exp    | text    |                                |
| memo           | text    |                                |

#### Association

- belongs_to :client


### user テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| name             | string  | null: false |
| name_kana        | string  | null: false |
| password         | string  | null: false |
| staff_number     | integer | null: false |
| position_id      | integer | null: false |
| qualification_id | integer | null: false |
| work_style_id    | integer | null: false |
| picture          | text    |             |

#### Association
- has_many :rooms, through: room_user
- has_many :room_users
- has_many :messages
- has_many :relationships
- has_many :clients, through: :relationships


### rooms テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| client_id | integer    | null: false, foreign_key: true |

#### Association
- belongs_to :client
- has_many :user, through: room_staff
- has_many :room_user
- has_many :messages


### room_user テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| room_id   | integer    | null: false, foreign_key: true |
| user_id   | integer    | null: false  foreign_key: true |

#### Association
- belongs_to :room
- belongs_to :user


### messages テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user_id   | integer    | null: false, foreign_key: true |
| room_id   | integer    | null: false  foreign_key: true |
| content   | text       | null: false                    |
| picture   | text       |                                |
| tag_id    | integer    |                                |

#### Association
- belongs_to :room
- belongs_to :user


### relationships テーブル

| Column    | Type        | Options                        |
| --------- | ----------- | ------------------------------ |
| user      | references  | null: false, foreign_key: true |
| client    | references  | null: false  foreign_key: true |

#### Association
- belongs_to :user
- belongs_to :client


### records テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | -------------------------------|
| client         | references | null: false, foreign_key: true |
| user           | references | null: false, foreign_key: true |
| start_time     | datetime   | null: false                    |
| end_time       | datetime   | null: false                    |
| major_item_id  | integer    | null: false                    |
| main_item_id   | integer    | null: false                    |
| sub_item_id    | integer    | null: false                    |
| remind         | boolean    |                                |
| carryout_id    | integer    | null: false                    |
| meal_m_id      | integer    |                                |
| meal_s_id      | integer    |                                |
| water_amount   | integer    | default: 0                     |
| exc_shape_id   | integer    |                                |
| exc_amount_id  | integer    |                                |
| urine_amount   | integer    | default: 0                     |
| memo           | text       |                                |

#### Association
- belongs_to :client

### nutritions テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | -------------------------------|
| client              | references | null: false, foreign_key: true |
| user                | references | null: false, foreign_key: true |
| date                | date       | null: false                    |
| six_water_amount    | integer    | null: false, default: 0        |
| morning_meal_m_id   | integer    | null: false, default: 1        |
| morning_meal_s_id   | integer    | null: false, default: 1        |
| ten_water_amount    | integer    | null: false, default: 0        |
| lunch_meal_m_id     | integer    | null: false, default: 1        |
| lunch_meal_s_id     | integer    | null: false, default: 1        |
| lunch_water_amount  | integer    | null: false, default: 0        |
| fifty_water_amount  | integer    | null: false, default: 0        | | dinner_meal_m_id    | integer    | null: false, default: 1        |
| dinner_meal_s_id    | integer    | null: false, default: 1        |
| dinner_water_amount | integer    | null: false, default: 0        |
| twenty_water_amount | integer    | null: false, default: 0        |

### Association
- belongs_to :client


### reports テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | -------------------------------|
| client_id      | integer    | null: false                    |
| user_id        | integer    | null: false                    |
| occ_time       | datetime   | null: false                    |
| place_id       | integer    | null: false                    |
| genre_id       | integer    | null: false                    |
| res_id         | integer    | null: false                    |
| level_id       | integer    | null: false                    |
| content        | text       |                                |
| picture        | text       |                                |
| coping         | text       |                                |
| contact_id     | integer    |                                |
| hospital       | text       |                                |
| desc_date      | datetime   |                                |
| desc_user      | integer    |                                |
| desc_content   | text       |                                |
| count_content  | text       |                                |
| check_id       | integer    | null: false, default: 0        |

#### Association
- belongs_to :client
