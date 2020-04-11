require 'scryfall'

num_cards = Scryfall::Catalog.card_names.total_values

puts "Magic is a simple game; there are only #{num_cards} cards! Simple!"
