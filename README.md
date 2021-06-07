
# Alanui Pua
![B17A59F2-ABF9-45A4-9012-1E4B12295A45_1_105_c](https://user-images.githubusercontent.com/72491735/100496702-72295200-3199-11eb-9323-6fa15460dc9e.jpeg)

## App URL
https://alanui-pua.herokuapp.com/
## テスト用アカウント
・メールアドレス : test@com

・パスワード : aaaaaa

## 目的
SNSを利用する上で誹謗中傷が問題視されていることを背景に「悪評価というものそのものを見つめなおし、良い感情や出来事に目を向けよう。」という意図を込め作成したアプリケーションです。

## アプリケーション概要
 「良い感情に目を向ける」をコンセプトとした、文章投稿アプリケーションです。

### ユーザーストーリー（課題）
・現在のネットリテラシーの欠如により、SNSの利用の継続に抵抗を感じている。

・他SNSで誹謗中傷などに悩まされていたり、否定的な意見を目にすることに疲弊している。
#### 毎日利用する情報ツールというよりも、1週間に一回や空き時間に利用できる居心地の良い居場所として活用できる様なアプリケーションをイメージしました。

## アプリケーション機能一覧

### ユーザー管理機能

 ユーザー登録をすると投稿やお気に入り登録ができる。
 
### 投稿一覧機能（未ログインで閲覧可）

全ての投稿を一覧表示される。
 
### 投稿機能

 ・タイトル ・カテゴリー（選択） ・本文 ・画像（任意）が投稿できる。


### 投稿詳細機能（未ログインで閲覧可）
 投稿一覧から投稿を選択すると選択した投稿の詳細が見られる。
 
 ログインユーザーで詳細ページからあればお気に入りとBudを付けられる
 <img width="1217" alt="E3DD7D8D-283E-41ED-8763-62428C9B0AB3" src="https://user-images.githubusercontent.com/72491735/100496849-e6b0c080-319a-11eb-862a-7a02a401bb21.png">

 
### マイページ機能

 ログインユーザーは自身の投稿とお気に入りをした投稿がマイページから見られる。
 <img width="1277" alt="AFDD40CD-5209-41DC-82A0-A5FC480CFE6A" src="https://user-images.githubusercontent.com/72491735/100496787-3773e980-319a-11eb-84ff-3ff4a3463816.png">

 
### お気に入り機能

 ハートマークをクリックするとお気に入り登録する事ができる。
 
 投稿詳細の画面にお気に入り数が表示される。
 
 お気に入り登録一覧がマイページから閲覧できる。
 
### Bad機能

 バッドマークをクリックするとRethink画面が表示され本当にBudを押すか再確認の画面が表示される。
 
 Badを押すを選択するとBud評価を押す事ができる。
 
### Bad評価が5つ付くと投稿にcloseと表示される

 closeが表示されるとお気に入りとBadは付ける事ができなくなる。
 <img width="1403" alt="9DA876E6-DC67-4317-AD51-153B2F585287" src="https://user-images.githubusercontent.com/72491735/100496815-96396300-319a-11eb-800e-5f5b7373e66b.png">


## 各機能の実装目的

### お気に入り機能

お気に入り機能を付けることで共感した投稿や見て良い感情になった投稿を一覧で見返す事ができる様にする為。

### Close機能

悪評価（Bad評価）というものそのもの概念を重くする事が狙い。

Rethink画面を表示する事で「本当に良くない内容の投稿だったのか」と深く考える時間を設ける事が狙い。

### コメント機能を付けない理由について

誹謗中傷が問題視されている事を背景に匿名で簡単にコメント出来てしまうシステムはこのアプリケーションには必要がないと判断した為。

## 開発環境

インフラにはherokuを使っています。

Ruby on Rails 

html

css
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

### Association

- belongs_to :user
- has_one    :like
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
