require 'json'
require 'open-uri'

# TODO - Let's fetch name and bio from a given GitHub username
github_username = "PONHA_AQUI_SEU_USERNAME"
url = "https://api.github.com/users/#{github_username}"

# Url -> String
url_info = open(url).read

# String -> Hash
obj = JSON.parse(url_info)

p obj
