require 'spec_helper'

describe Scryfall::Card do

  describe "search" do
    let(:query) { "oracle:draw oracle:a oracle:card type:sorcery color:U mana:{U} cmc:1" }

    it "returns a List object" do
      cards = Scryfall::Card.search(query)
      expect(cards).to be_a Scryfall::List
    end
  end


  describe "named" do
    let(:card_name) { "Azra Smokeshaper" }

    it "returns a Card object" do
      card = Scryfall::Card.named(card_name, mode: "exact")
      expect(card).to be_a Scryfall::Card
    end
  end

  describe "random" do

    it "returns a Card object" do
      card = Scryfall::Card.random
      expect(card).to be_a Scryfall::Card
    end
  end

  describe "collection" do
    let(:identifiers) {
      {
          "identifiers": [
              {
                  "name": "Azra Smokeshaper"
              },
              {
                  "set": "mrd",
                  "collector_number": "150"
              }
          ]
      }.to_json
    }

    it "returns a List object" do
      cards = Scryfall::Card.collection(identifiers)
      expect(cards).to be_a Scryfall::List
    end
  end

  describe "by_id" do
    let(:card_id) { "79fe9e5e-3ddc-4b15-81d5-9659cd087649" }
    let(:fake_id) { "abc" }

    it "returns a Card object" do
      card = Scryfall::Card.by_id(card_id)
      expect(card).to be_a Scryfall::Card
    end
  end
end