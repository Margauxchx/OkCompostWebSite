require 'csv'

def extract_content_of(file)
  content_by_row=[]
  #il faut déclarer la variable avant le each do pour pouvoir le réutiliser en dehors du each do
  CSV.foreach (file) do |read_content|
  #la fonction CSV li le fichier ligne par ligne.
  #cette lecture extrait chaque ligne en un array
    content_by_row << read_content
    #chaque array_de_ligne s'enregistre dans le hash content_by_row.
    #on  a donc un empilement de array
    end
  return content_by_row
end

def perform
  content=[]
  content = extract_content_of('list.csv')
  puts "================================================================="
  puts content
  puts "================================================================="
  puts content[0]
  puts "================================================================="
  puts content[0][0]
  puts "================================================================="
  #maintenant on à le tout le contenu du csv array_de_ligne par array_de_ligne
  #on souhaite utiliser chacune de ces lignes dans le seeds
  #tout d'abord essayons d'extraire un array_de_ligne du hash content_by_row
end

perform
