require 'open-uri'
require 'nokogiri'

def initialize_nogiri(url)
  #On récupère la page des crypto
  url_open = Nokogiri::HTML(open(url))
end

def crypto_scrapper(url_open)

  nom	= []
  adresse = []
  ville = []
  région = []
  cp = []
  tel = []
  mail = []
  type = []
  horaires = []

  url_open.css('td.text-left.col-symbol, a.price').each do |item|
    nom <<  item.text
  end
    #doc = File.open("liste2.csv") { |f| Nokogiri::XML(f) }
end


def perform
  url_open = initialize_nogiri("https://coinmarketcap.com/all/views/all/")
  puts crypto_scrapper(url_open)
end

perform
