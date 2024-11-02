class SearchController < ApplicationController
  # require 'google/apis/customsearch_v1'
  # require 'net/http'
  # require 'uri'

  # def index
  #   # JSONファイルを読み込む
  #   file = File.read(Rails.root.join('db', 'products.json'))
  #   products = JSON.parse(file)

  #   # 例えば、最初の商品のタイトルをクエリとして使用
  #   query = products.second['title']#2個目の.jsonを見ている。
  #   @results = custom_search(query)
  # end
  # def index
  #   # JSONファイルを読み込む
  #   file = File.read(Rails.root.join('db', 'products.json'))
  #   products = JSON.parse(file)
  
  #   # 結果を格納する配列
  #   @all_results = []
  
  #   # 各商品のタイトルをクエリとして使用して検索
  #   products.each do |product|
  #     query = product['title'] + " ブログ"# 上位はamazonのリンクばかりだから"ブログ"を追加した。
  #     results = custom_search(query)
  #     @all_results.concat(results)  # 結果を全ての結果配列に追加
  #   end
  
  #   # 最終的な結果をビューに渡す
  #   @results = @all_results
  # end
  

  # private

  # def custom_search(query)
  #   # クエリをURLエンコード
  #   encoded_query = URI.encode_www_form_component(query)
  #   #表示を5件づつにする。
  #   url = "https://www.googleapis.com/customsearch/v1?key=AIzaSyAkqQ_t-4_D5mEISbhLb7m5eoSgkMBn4Ok&cx=d3b1b41e12e224a20&q=#{encoded_query}&num=5"
    
  #   # HTTPリクエストを送信
  #   uri = URI.parse(url)
  #   response = Net::HTTP.get_response(uri)
  
  #   # レスポンスをJSONとしてパース
  #   if response.is_a?(Net::HTTPSuccess)
  #     JSON.parse(response.body)['items']
  #   else
  #     []
  #   end
  # end
end
