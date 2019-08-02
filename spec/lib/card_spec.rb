require 'spec_helper'

describe Scryfall::Card do

  describe "search" do
    let(:query) { "oracle:draw oracle:a oracle:card type:sorcery color:U mana:{U} cmc:1" }
    let(:fake_query) { "oracle:get oracle:tilted" }

    it "returns a List object" do
      cards = Scryfall::Card.search(query)
      expect(cards).to be_a Scryfall::List
    end

    it "raises an Error when no matching cards exist" do
      expect {
        Scryfall::Card.search(fake_query)
      }.to raise_error Scryfall::NotFoundError
    end
  end


  describe "named" do
    let(:card_name) { "Azra Smokeshaper" }
    let(:fake_name) { "maro254" }

    it "returns a Card object" do
      card = Scryfall::Card.named(card_name, mode: "exact")
      expect(card).to be_a Scryfall::Card
    end

    it "raises an Error when Card doesn't exist" do
      expect {
        Scryfall::Card.named(fake_name)
      }.to raise_error Scryfall::NotFoundError
    end
  end

  describe "random" do

    it "returns a Card object" do
      card = Scryfall::Card.random
      expect(card).to be_a Scryfall::Card
    end
  end

  describe "collection" do
    let(:identifiers) { {"identifiers": [{"set": "mrd", "collector_number": "150"}]}.to_json }
    let(:fake_identifiers) { {"identifiers": [{"name": "maro254"}]}.to_json }

    it "returns a List object" do
      cards = Scryfall::Card.collection(identifiers)
      expect(cards).to be_a Scryfall::List
    end

    it "should not raise an Error when a Card doesn't exist" do
      expect {
        Scryfall::Card.collection(fake_identifiers)
      }.not_to raise_error
    end

  end

  describe "id" do
    let(:card_id) { "79fe9e5e-3ddc-4b15-81d5-9659cd087649" }
    let(:fake_id) { "abc" }

    it "returns a Card object" do
      card = Scryfall::Card.id(card_id)
      expect(card).to be_a Scryfall::Card
    end

    it "should raise an Error when the ID doesn't exist" do
      expect {
        Scryfall::Card.id(:fake_id)
      }.to raise_error Scryfall::NotFoundError
    end
  end
end