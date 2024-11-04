class ProductsController < ApplicationController
  require 'google/apis/customsearch_v1'
  require 'net/http'
  require 'uri'

  def index

    ## Amazon books scrape ##
    url = params[:url] || 'https://www.amazon.co.jp/gp/bestsellers/books/503670'
    # get page source to scrape
    @html_source = fetch_html(url)
    # scrape, display at view
    @extracted_element = extract_elements(@html_source)

    ## Amazon books stored in file
    book_titles_path = Rails.root.join('db', 'amazon_books.json')
    File.write(book_titles_path, JSON.pretty_generate(@extracted_element))

    #for amazon view & google query
    amazon_file = File.read(Rails.root.join('db', 'amazon_books.json')) 
    @amazon_books = JSON.parse(amazon_file)

    ## Google scrape(using Amazon.title for query) ##

    

    # @blog_posts_result = {}

    # @amazon_books.each do |amazon_book|
    #   # google検索内容
    #   query = amazon_book['title'] + " ブログ" # 上位はAmazonのリンクばかりだから"ブログ"を追加した。
    #   # google検索実行
    #   results = custom_search(query)
    #   @blog_posts_result[amazon_book['title']] = results
    # end

    # google検索結果をファイルに書き出す
     blog_posts_file_path = Rails.root.join('db', 'blog-posts.json')
    # File.write(blog_posts_file_path, JSON.pretty_generate(@blog_posts_result))


    # 変数 = ファイルを読み込む(MVCの可読性を上げるためにviewから直接呼び出さないため)
      blog_posts_json = File.read(blog_posts_file_path)
      @blog_posts_result = JSON.parse(blog_posts_json)
      puts @blog_posts_result.inspect
  end

  private

  # amazonはlib/scraper.rbへ
  ## GoogleCustomeSerarchApiの準備
  def custom_search(query)
    # クエリをURLエンコード
    encoded_query = URI.encode_www_form_component(query)
    # 表示を5件ずつにする
    url = "https://www.googleapis.com/customsearch/v1?key=AIzaSyAkqQ_t-4_D5mEISbhLb7m5eoSgkMBn4Ok&cx=d3b1b41e12e224a20&q=#{encoded_query}&num=5"
    
    # HTTPリクエストを送信
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
  
    # レスポンスをJSONとしてパース
    if response.is_a?(Net::HTTPSuccess)
      JSON.parse(response.body)['items']
    else
      []
    end
  end


  def fetch_html(url)
    begin
      html = URI.open(url) # URLからHTMLを取得
      Nokogiri::HTML(html) # NokogiriでHTMLをパース
    rescue StandardError => e
      return "Error: #{e.message}" # エラーメッセージを返す
    end
  end

  def extract_elements(doc)
    # 書籍情報を格納する配列を作成
    books = doc.css('#gridItemRoot .p13n-sc-uncoverable-faceout').map do |item|
      {
        title: item.at_css('._cDEzb_p13n-sc-css-line-clamp-1_1Fn1y').text.strip, # タイトル
        image_url: item.at_css('img')['src'], # 画像URL
        link: "https://www.amazon.co.jp" + item.at_css('a')['href'] # Amazonのリンク
      }
    end
  
    books
  end

end



