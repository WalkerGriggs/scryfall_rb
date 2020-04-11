require 'scryfall'

rtr_set     = Scryfall::Set.code("RTR")
largest_set = Scryfall::Set.all.max_by(&:card_count)

puts "#{rtr_set.name} has #{rtr_set.card_count} cards."
puts "Compare that to #{largest_set.name}, which has #{largest_set.card_count} cards!"
