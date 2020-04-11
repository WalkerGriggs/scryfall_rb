require 'scryfall'

# Scryfall has a rigorous search query syntax.
# --> tldr; read https://scryfall.com/docs/syntax

card_name = "Karn"
format    = "modern"
card_type = "planeswalker"
max_cmc   = 4

query = "name:#{card_name} f:#{format} t:#{card_type} cmc<=#{max_cmc}"

cards = Scryfall::Card.search(query).map(&:name)

puts "Modern legal Karn planeswalkers with CMC 4 or less: #{cards}"
