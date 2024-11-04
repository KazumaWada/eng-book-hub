require 'nokogiri'
require 'open-uri'
require 'json'
# amazon API Gateway

class Scraper
  def self.scrape_site(url)
    # URLからHTMLを取得
    html = URI.open(url)
    # Nokogiriを使用してHTMLをパース
    doc = Nokogiri::HTML(html)

    # データの抽出例
    results = []
    doc.css('.item').each do |item|  # .itemは対象の要素のCSSセレクタ
      title = item.css('.title').text
      link = item.css('a').attribute('href').value
      results << { title: title, link: link }
    end

    #Amazonのスクレイプ結果をファイルに書き出す
    File.write(Rails.root.join('db', 'scraped_data.json'), JSON.pretty_generate(results))
    results
  end
end