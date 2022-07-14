require 'rubygems'
  require 'open-uri'
    require 'nokogiri'

    doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
    doc.xpath('//*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[1]/td[2]/div/a[1]').each do |node| //*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[1]/td[2]/div/a[1]
      puts node.text
    end
=begin
page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))   
puts page.class   # => Nokogiri::HTML::Document

Xpath

=begin
crypto_name_array
crypto_nameS .each
Rappel: un hash s’initialise avec result = Hash.new 
et on y stocke des infos avec result['ta_key'] = 'ta_value'

a = [
  { "BTC" => 5245.12 },
  { "ETH" => 217.34 }, 
  etc
]

=end

def scraping(url)
  html = open("#{url}").read
  nokogiri_doc = Nokogiri::HTML(html)
  final_array = []

  nokogiri_doc.search("a span").each do |element|
    element = element.text
    final_array << element 
  end

  final_array.each_with_index do |index, element|
    puts "#{index + 1} - #{element}"
  end
end

scraping('https://coinmarketcap.com/all/views/all/')







require 'nokogiri'
require 'open-uri'

def define_page
  page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
end

def extract_crypto
  page = define_page
  list_cryptos = []

  page.xpath('//*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody //div/a[contains(@class, "cmc-table__column-name--symbol")]').each do |crypto|
    list_cryptos.push(crypto.text)
  end
  return list_cryptos
end

def extract_values
  page = define_page
  list_values = []

  page.xpath('//*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody //td[contains(@class, "cmc-table__cell--sort-by__price")]/div/a/span').each do |value|
    list_values.push(value.text.gsub(/[$,]/, '').to_f)
  end
  return list_values
end

def create_final_array

  list_cryptos = extract_crypto
  list_values = extract_values
  final_list = []
  array_length = list_cryptos.length

  for i in 0..(array_length - 1) 
    h = {list_cryptos[i]=> list_values[i]}
    final_list.push(h)
  end

  return final_list
end

final_list = create_final_array
puts final_list

