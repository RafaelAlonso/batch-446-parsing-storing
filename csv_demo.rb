require 'csv'

# TODO - let's read/write data from beers.csv
filepath     = 'data/beers.csv'
new_filepath = 'data/new_beers.csv'
csv_options  = {
  col_sep: ',',
  quote_char: '"',
  headers: :first_row
}

# PARSING
# estamos lendo cada linha do arquivo CSV separadamente
CSV.foreach(filepath, csv_options) do |linha|
  puts "A aparencia da cerveja é #{linha['Name']}"
end

# STORING
first_row = ["Name","Appearance","Origin"]
beer_info = ['Stella', 'Lager', 'Belgium']

# Comeca o arquivo do zero ('wb' => write binary)
CSV.open(new_filepath, 'wb', csv_options) do |csv|
  csv << first_row
  csv << beer_info
end

# Acrescenta no final do arquivo
puts 'Qual sua cerveja favorita?'
nome_cerveja = gets.chomp

puts 'Qual a aparencia dela?'
apar_cerveja = gets.chomp

puts 'Da onde ela vem?'
orig_cerveja = gets.chomp

# reparem o 'ab' (append binary) ao invés de 'wb' (write binary)
CSV.open(filepath, 'ab', csv_options) do |csv|
  csv << [nome_cerveja, apar_cerveja, orig_cerveja]
end



