# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | null: false             |
| password           | string              | null: false             |
| nickname           | string              | null: false             |

### Association

- has_many :posts
- has_many :buds

## posts table

| Column             | Type       | Options           |
|--------------------|------------|-------------------|
| title              | string     | null: false       |
| text               | text       | null: false       |
| user               | references | foreign_key: true |
| bud                |
| like               |

### Association

- belongs_to :user
- has_one    :bud

## buds table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| post        | references | foreign_key: true |
| user        | references | foreign_key: true |

### Association

- belongs_to :post
- belongs_to :user