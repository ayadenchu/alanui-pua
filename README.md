
# Alanui Pua

 「ポジティブな話に目を向ける」をコンセプトに、それぞれの感性で文章を投稿し投稿者は自分が感じた良い感情を文字に起こすことで幸福感を保存できる場になり
閲覧者は現状の環境に刺激がない時や、悩みがあり、疲労感を感じた時に全く環境が違う人々の美談を見て心が豊かになる様なアプリケーション。

 
## description

Alanui Puaではポジティブな内容のみを投稿するというアプリケーションになっています。

『誹謗中傷』など悪意があるものにはbud評価をつける事ができ、5つbud評価がつくと投稿がクローズしてしまいます。
 

#
#
# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | null: false             |
| password           | string              | null: false             |
| nickname           | string              | null: false             |

### Association

- has_many :posts
- has_many :likes
- has_many :buds

## posts table

| Column             | Type       | Options           |
|--------------------|------------|-------------------|
| title              | string     | null: false       |
| text               | text       | null: false       |
| category_id        | string     | null: false       |
| user               | references | foreign_key: true |
| bud                |
| like               |

### Association

- belongs_to :user
- has_one    :likes
- has_one    :bud

## likes table
| Column      | Type       | Options           |
|-------------|------------|-------------------|
| post        | references | foreign_key: true |
| user        | references | foreign_key: true |

### Association

- belongs_to :post
- belongs_to :user

## buds table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| post        | references | foreign_key: true |
| user        | references | foreign_key: true |

### Association

- belongs_to :post
- belongs_to :user