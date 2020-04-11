require 'scryfall'

card = Scryfall::Card.named("stasis")

# The basics
name = card.name
set = card.set_name
cmc = card.cmc.to_i
type = card.type_line
oracle_text = card.oracle_text.gsub("\n", " ")

# Get legal formats
legal_formats = card.legalities
                  .to_h
                  .select { |format, legality| legality == "legal" }
                  .keys
                  .join(", ")

puts "#{name} from #{set} is a #{cmc} CMC #{type} that reads: \"#{oracle_text}\""
puts "#{name} is legal in: #{legal_formats}."
