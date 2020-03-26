Name
====
[Send Furniture](https://send-furniture.herokuapp.com/)
![トップページ](public/readme_img/3cf1d299511ad55dd76bcef22c8da1cd.jpg)

# 概要
インテリア共有SNSです。
自分の部屋や、家具の写真を投稿し、その投稿に対してコメントなどで交流できます。
私自身、お洒落な部屋や家具を見るのが好きだったので、もっと気軽にいろんな人の部屋を見てみたい！という思いで作成しました。

# 開発環境
- Ruby on Rails
- jQuery
- VSCode（Visual Studio Code）
- heroku
- Google Chrome

# アプリの機能

### 投稿機能
![投稿機能](https://user-images.githubusercontent.com/60598776/77602633-480bfa00-6f51-11ea-9758-21454d6c34f5.gif)
### タグ登録機能
記事ごとに、タグを登録し、カテゴリー化できます。
![タグ機能](https://user-images.githubusercontent.com/60598776/77603647-f2851c80-6f53-11ea-84e8-82eed089bc9f.png)
### コメント機能
記事に対して、コメントをする事ができます。
![コメント機能](https://user-images.githubusercontent.com/60598776/77603477-8b676800-6f53-11ea-8384-933c7a539063.gif)
### 検索機能
気になるキーワードで、投稿を検索する事ができます。
![検索機能](https://user-images.githubusercontent.com/60598776/77603527-ac2fbd80-6f53-11ea-8e4e-1ac6f1e57b11.gif)
### レスポンシブ
画面幅に応じて、その画面幅にあった表示に対応します。
![レスポンシブ](https://user-images.githubusercontent.com/60598776/77603571-c7023200-6f53-11ea-822c-d1eba38d546d.gif)

# Usage
```
$ git clone https://github.com/nom30523/send-furniture.git
$ cd send-furniture
$ bundle install
$ rails db:create
$ rails db:migrate
$ rails s
👉 http://localhost:3000
```
