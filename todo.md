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

日数を置いて、100個ゲットしてみる。
# ファイルに結果を保存する。
blog-posts.jsonを実装する。

ファイルから結果をゲットできるようにする。

# zenn
なんでファイルか?
google リクエストの制限があるから。一度全てファイルに書き込んで仕舞えばok
データ内容は変わらず、そこまで大量ではないから。

# amazonスクレイプ
nokogiriでまず対象のwebサイトのsourceを全て取得している。
↓
## 今
そこから解析してスクレイぷすることができるようになる。
値段、とか余計なものは書かない。クリックさせてからわからせるようにするため。こっちの手間も省ける。
- 
nokogiriでwebページのsourceを取得してくることができる。(指定した要素も取得してくることができる。)まずそれを自分のファイルに記述してみる。

これがページのソース
<div class="watch-button-placeholder aok-hidden"></div>
</div>
</div>
</div>
<div id="gridItemRoot" class="a-column a-span12 a-text-center _cDEzb_grid-column_2hIsc">
<div id="p13n-asin-index-11" class="a-cardui _cDEzb_grid-cell_1uMOS expandableGrid p13n-grid-content" data-a-card-type="basic">
<div data-asin="4761275421" class="_cDEzb_iveVideoWrapper_JJ34T">
<div class="a-section zg-bdg-ctr">
  <div class="a-section zg-bdg-body zg-bdg-clr-body aok-float-left">
    <span class="zg-bdg-text">#12</span>
  </div>
  <div class="a-section zg-bdg-tri zg-bdg-clr-tri aok-float-left"></div>
</div>
<div class="zg-grid-general-faceout">
  <div id="4761275421" class="p13n-sc-uncoverable-faceout">
    <a class="a-link-normal aok-block" tabindex="-1" href="/%E8%8B%B1%E4%BC%9A%E8%A9%B1%E3%81%AF%E7%AD%8B%E3%83%88%E3%83%AC%E3%80%82-%E4%B8%AD2%E3%83%AC%E3%83%99%E3%83%AB%E3%81%AE100%E4%BE%8B%E6%96%87%E3%81%A0%E3%81%91-1%E3%81%8B%E6%9C%88%E3%81%A7%E8%8B%B1%E8%AA%9E%E3%81%8C%E3%82%B9%E3%83%A9%E3%82%B9%E3%83%A9%E3%81%97%E3%82%83%E3%81%B9%E3%82%8C%E3%82%8B%E3%80%82-%E8%88%B9%E6%A9%8B-%E7%94%B1%E7%B4%80%E5%AD%90/dp/4761275421/ref=zg_bs_g_503670_d_sccl_12/000-0000000-0000000?psc=1" role="link">
      <div class="a-section a-spacing-mini _cDEzb_noop_3Xbw5">
        <img alt="英会話は筋トレ。 中2レベルの100例文だけ! 1か月で英語がスラスラしゃべれる。" src="https://images-fe.ssl-images-amazon.com/images/I/81XSBSa-rNL._AC_UL300_SR300,200_.jpg" class="a-dynamic-image p13n-sc-dynamic-image p13n-product-image" height="200px" data-a-dynamic-image='{"https://images-fe.ssl-images-amazon.com/images/I/81XSBSa-rNL._AC_UL300_SR300,200_.jpg":[300,200],"https://images-fe.ssl-images-amazon.com/images/I/81XSBSa-rNL._AC_UL600_SR600,400_.jpg":[600,400],"https://images-fe.ssl-images-amazon.com/images/I/81XSBSa-rNL._AC_UL900_SR900,600_.jpg":[900,600]}' style="max-width:300px;max-height:200px">
      </div>
    </a>
    <div>
      <div>
        <a class="a-link-normal" href="/%E8%8B%B1%E4%BC%9A%E8%A9%B1%E3%81%AF%E7%AD%8B%E3%83%88%E3%83%AC%E3%80%82-%E4%B8%AD2%E3%83%AC%E3%83%99%E3%83%AB%E3%81%AE100%E4%BE%8B%E6%96%87%E3%81%A0%E3%81%91-1%E3%81%8B%E6%9C%88%E3%81%A7%E8%8B%B1%E8%AA%9E%E3%81%8C%E3%82%B9%E3%83%A9%E3%82%B9%E3%83%A9%E3%81%97%E3%82%83%E3%81%B9%E3%82%8C%E3%82%8B%E3%80%82-%E8%88%B9%E6%A9%8B-%E7%94%B1%E7%B4%80%E5%AD%90/dp/4761275421/ref=zg_bs_g_503670_d_sccl_12/000-0000000-0000000?psc=1" role="link">
          <span>
            <div class="_cDEzb_p13n-sc-css-line-clamp-1_1Fn1y">英会話は筋トレ。 中2レベルの100例文だけ! 1か月で英語がスラスラしゃべれる。</div>
          </span>
        </a>
        <div class="a-row a-size-small">
          <a class="a-size-small a-link-child" href="/%E8%88%B9%E6%A9%8B-%E7%94%B1%E7%B4%80%E5%AD%90/e/B08DV8CV8Q/ref=zg_bs_g_503670_d_sccl_12_bl/000-0000000-0000000">
            <div class="_cDEzb_p13n-sc-css-line-clamp-1_1Fn1y">船橋 由紀子</div>
          </a>
        </div>
        <div class="a-row">
          <div class="a-icon-row">
            <a class="a-link-normal" title="5つ星のうち4.0" href="/product-reviews/4761275421/ref=zg_bs_g_503670_d_sccl_12_cr/000-0000000-0000000">
              <i class="a-icon a-icon-star-small a-star-small-4 aok-align-top">
                <span class="a-icon-alt">5つ星のうち4.0</span>
              </i> 
              <span class="a-size-small">530</span>
            </a>
          </div>
        </div>
        <div class="a-row a-size-small">
          <span class="a-size-small a-color-secondary a-text-normal">単行本（ソフトカバー）</span>
        </div>
        <div class="a-row">
          <a class="a-link-normal" href="/%E8%8B%B1%E4%BC%9A%E8%A9%B1%E3%81%AF%E7%AD%8B%E3%83%88%E3%83%AC%E3%80%82-%E4%B8%AD2%E3%83%AC%E3%83%99%E3%83%AB%E3%81%AE100%E4%BE%8B%E6%96%87%E3%81%A0%E3%81%91-1%E3%81%8B%E6%9C%88%E3%81%A7%E8%8B%B1%E8%AA%9E%E3%81%8C%E3%82%B9%E3%83%A9%E3%82%B9%E3%83%A9%E3%81%97%E3%82%83%E3%81%B9%E3%82%8C%E3%82%8B%E3%80%82-%E8%88%B9%E6%A9%8B-%E7%94%B1%E7%B4%80%E5%AD%90/dp/4761275421/ref=zg_bs_g_503670_d_sccl_12/000-0000000-0000000?psc=1" role="link">
            <span class="a-color-secondary">53個の商品：
              <span>
                <span class="p13n-sc-price">￥926</span>
              </span>から
            </span>
          </a>
        </div>
      </div>
    </div>
  </div>
</div>


"紹介されている記事"を取得していく。
そのためにタイトルのデータをどうやって管理するか考える。
amazonからスクレイぷしてきたら、ファイルに保存するのか、そのまま使うのか。。
product_controller18 line
↓
amazonの3つのデータを.jsonに格納する。
↓
そっからデータを取得してgoogle検索apiの引数へ渡す。

記事の管理についてはこれが終わった後に後ほど。

つまり、一度amazonからスクレイピングする
↓
ファイルに書き出す
↓
その関数は終わりで以降は常にファイルから読み出す。
# 続きこのgptを読んで実装していく
はい、その流れで問題ありません。スクレイピングで取得したAmazonのデータをJSONファイルに書き出し、その後はファイルから読み出して利用する形にすれば、毎回Amazonからスクレイピングする必要がなくなり、効率的かつ安定的にデータを管理できます。以下の流れで進めるのが良さそうです。

実装フロー
AmazonからスクレイピングしてJSONに書き出す

Amazonから取得したデータをJSON形式で保存する関数を作成し、データを書き出します。
これにより、Amazonへのアクセスは初回のスクレイピング時のみで済みます。
JSONファイルからデータを読み込み、Google Custom Search APIの引数として使用する

JSONファイルを読み込み、タイトルをGoogle Custom Search APIに渡す引数として使います。
データがファイルに保存されているので、アプリケーションを再起動しても同じデータを利用できます。
サンプルコード
以下のように実装すると、スムーズに処理が進むと思います。

1. Amazonスクレイピング関数
ruby
Copy code
require 'json'

def scrape_amazon_to_json
  # スクレイピングして取得したデータのサンプル
  products = [
    { title: "商品1", link: "https://www.amazon.co.jp/dp/example1", image: "https://images.example1.jpg" },
    { title: "商品2", link: "https://www.amazon.co.jp/dp/example2", image: "https://images.example2.jpg" }
  ]

  # JSONファイルに書き出す
  file_path = Rails.root.join('db', 'products.json')
  File.write(file_path, JSON.generate(products))

  puts "Amazonデータをファイルに保存しました: #{file_path}"
end
2. JSONファイルからデータを読み込み、Google Custom Search APIへ渡す
ruby
Copy code
def search_with_google_api
  file_path = Rails.root.join('db', 'products.json')
  products = JSON.parse(File.read(file_path))

  # Google Custom Search APIのセットアップ
  service = Google::Apis::CustomsearchV1::CustomsearchService.new
  service.key = 'YOUR_GOOGLE_API_KEY'  # Google APIキーを設定

  products.each do |product|
    title = product['title']
    
    # タイトルをGoogle検索APIで検索
    result = service.list_cses(q: title, cx: 'YOUR_SEARCH_ENGINE_ID')
    puts "検索結果 for '#{title}':"
    puts result.items.map { |item| item.title } if result.items
  end
end
この実装方法のメリット
効率的: 一度Amazonからスクレイピングしてデータを保存すれば、以降は毎回ファイルから読み込むだけで済むため、処理速度が向上します。
再利用性: ファイルに保存されたデータを、他の関数や用途でも簡単に再利用できます。
信頼性: 外部サイトへのアクセス頻度を減らすことで、アクセス制限や予期せぬエラーのリスクも軽減できます。
まとめ
このような流れで問題なくデータを管理できるでしょう。後からファイル内のデータを別の用途に使いたい場合も、JSONファイルを読み込むだけで済むので柔軟に対応可能です。




# 続き
まず、jsonの形をちゃんと調べる。