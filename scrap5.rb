require 'csv'

def extract_content_of(file)
  content_by_row=""
  n=0
  m=""
#il faut déclarer la variable avant le each do pour pouvoir le réutiliser en dehors du each do
  CSV.foreach (file) do |read_content|
#la fonction CSV li le fichier ligne par ligne.
#cette lecture extrait chaque ligne en un array

#créer une clé par ligne_de_array pour les identifer dans la hash
    puts "k#{n} #{read_content.inspect}"
    m = "k" & n read_content.inspect
    puts m
    content_by_row << read_content.inspect
#chaque array_de_ligne s'enregistre dans le hash content_by_row.
#on a donc un empilement de array
    n=n+1
    end

    return content_by_row

end

def perform
  puts extract_content_of('liste2.csv')
#maintenant on à le tout le contenu du csv array_de_ligne par array_de_ligne
#on souhaite utiliser chacune de ces lignes dans le seeds
#tout d'abord essayons d'extraire un array_de_ligne du hash content_by_row
  puts "================================================================="

end

perform
