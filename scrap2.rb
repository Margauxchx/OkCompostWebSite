#appel des gems nécessaires au scrap
require 'open-uri'
require 'nokogiri'

#VIDEO SUIVIE : https://www.youtube.com/watch?v=Sw7dRmrYbL4

#RESULTAT : fonctionne en IRB. Mais ne fonctionne pas en fichier .rb
# => piste abandonnée

#OUVRIR UN URL
#URL à ourvir : https://coinmarketcap.com/all/views/all/
#page internet
#content = content of web page

create_temp_file_with_url = open('https://coinmarketcap.com/all/views/all/')
display_full_content = create_temp_file_with_url.read
puts display_full_content
