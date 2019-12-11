require 'open-uri'
require 'nokogiri'

def initialize_nogiri(page_url)
  #On récupère la page des crypto
  page = Nokogiri::HTML(open(page_url))
end

def crypto_scrapper(page)

  nom	= []
  adresse = []
  ville = []
  région = []
  cp = []
  tel = []
  mail = []
  type = []
  horaires = []


  cryptos = []
  result = []

  page.css('td.text-left.col-symbol, a.price').each do |item|
    cryptos <<  item.text
  end
