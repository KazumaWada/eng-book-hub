# googleAPI

あなたのケースの計算
1書籍につき1回のAPI呼び出し（5件取得）
50冊の書籍 = 50回のAPI呼び出し
無料枠は1日100クエリまで
つまり、1日で全ての書籍の関連記事を取得できる計算になります！

# amazonAPI

# railsコマンド

まずはdocker compose run web bundle install を実行する必要がある。
```ruby
# 3. Railsアプリケーションの新規作成&&DBをPostgresとして設定
docker-compose run web rails new . --force --database=postgresql
# このコマンドで以下が行われる：
# DBのinit
default: &default
  adapter: postgresql
  encoding: unicode
  host: db
  username: postgres
  password: password
# - Railsの基本ファイル群の生成
# - Gemfileの作成と設定
# - 必要なgemのインストール

# 4. イメージの再ビルド
docker-compose build
# 新しいGemfileの変更を反映

# 5. データベースの作成(設定と実際の作成は異なる)
docker-compose run web rails db:create
# 実際のデータベースが作成される
Created database 'eng_book_hub_development'
Created database 'eng_book_hub_test'

# 6. アプリケーションの起動
docker-compose up

# 新しいgemを追加した後
docker compose build
# または
docker compose run web bundle install
# マイグレーションファイルを作成した後
docker compose run web rails db:migrate
```

# 続き
googleapiとamazonapiを取得する。
https://www.scraperapi.com/
これでやった方が簡単だと行っている。けどまあとりあえず明日やってみるか。
理解する。

最初にamazonやろう。絵があるし。楽しいし。
取得したら、それを
バックエンドに実装していく。(何件取得するつもりなのか決める。)


amazonAPI
アカウントが売上を上げていないから、apiが使えない。&&サードパーティー等を使って違反するのが怖い
↓
まず手動でやってみる。
cardを作れる->リンクを貼るだけでok->スクレイピングしてくる。そのツールが。
✅手動で画像をコピーして、タイトルも取得する。出版日も。
↓
jsonを自分で作ってデータを保存する。まずは3件くらい作って、ループして表示させてみる。

# 今
googleAPIを使い途中。

ちゃんとわかるドキュメントのようなものがあればいいのかもわからない事がわからないから。
or
直接スクレイぷする。

https://www.googleapis.com/customsearch/v1?key=AIzaSyAkqQ_t-4_D5mEISbhLb7m5eoSgkMBn4Ok&cx=d3b1b41e12e224a20&q=hello

