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