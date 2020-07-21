require 'open-uri'
require 'nokogiri'

ingredient = 'PONHA_AQUI_O_INGREDIENTE_QUE_DESEJA_BUSCAR'
url = "https://www.bbcgoodfood.com/search/recipes?query=#{ingredient}"

# Url -> String
html_file = open(url).read

# String -> OBJ
html_doc = Nokogiri::HTML(html_file)
# p html_doc

# Busca dentro do Obj do tipo Nokogiri::HTML
# (receita de bolo)
html_doc.search('.teaser-item__title a').each do |element|
  puts element.text.strip
end
