require 'json'

# arquivo <-> string <-> Hash
# na direção "->" ==> Parsing
# na direção "<-" ==> Storing

# TODO - let's read/write data from beers.json
filepath    = 'data/beers.json'

# PARSING
# Ler o arquivo
file_info = File.read(filepath)
# p file_info # file é uma String

# Transformar a informação (String) num objeto de Ruby (Hash)
obj = JSON.parse(file_info)

# ================= Brincando com as infos =================
# utilize obj como uma hash
puts "O título das minhas cervejas é #{obj['title']}"

puts ""
my_beers = obj['beers'] # é uma Array
p my_beers

my_beers << {
      'Name': 'Black Princess',
      'Appearence': 'Bock',
      'Origin': 'Brasil'
    }

puts ""
sec_beer = my_beers[1] # é uma Hash
p sec_beer

puts ""
puts "O nome da minha segunda cerveja: #{sec_beer['name']}"
# ==========================================================

# STORING
new_beers = {
  'Title': 'Our great beers',
  'Beers': [
    ,
    {
      'Name': 'Summers Beer',
      'Appearence': 'Clara',
      'Origin': 'Suíça'
    }
  ]
}

puts ""
new_beers_as_string = JSON.generate(new_beers)
p new_beers_as_string

new_filepath = 'data/new_beers.json'
File.open(new_filepath, 'wb') do |file|
  file.write(new_beers_as_string)
end


