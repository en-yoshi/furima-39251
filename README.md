# README

## usersテーブル
| column             | type   | option                    |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birthday           | date   | null: false               |

### Association
- has_many :items
- has_many :orders


## itemテーブル
| column             | type      | option                         |
| ------------------ | ----------| -------------------------------|
| name               | string    | null: false                    |
| description        | string    | null: false                    |
| category           | string    | null: false                    |
| item_status        | string    | null: false                    |
| fee_status         | string    | null: false                    |
| prefecture         | string    | null: false                    |
| delivery_schedule  | string    | null: false                    |
| price              | date      | null: false                    |
| user               | references| null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order


## ordersテーブル
| column             | type      | option                         |
| ------------------ | ----------| -------------------------------|
| item               | references| null: false, foreign_key: true |
| user               | references| null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one :delivery


## deliveriesテーブル
| column             | type      | option                         |
| ------------------ | ----------| -------------------------------|
| order              | references| null: false, foreign_key: true |
| post_code          | string    | null: false                    |
| prefecture         | integer   | null: false                    |
| municipalities     | string    | null: false                    |
| house_number       | string    | null: false                    |
| building           | string    | null: false                    |
| phone_number       | string    | null: false                    |

### Association
- belongs_to :order
