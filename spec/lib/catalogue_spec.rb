require 'spec_helper'

describe Scryfall::Catalog do

  describe "card_names" do
    it "returns a Catalog object" do
      catalog = Scryfall::Catalog.card_names
      expect(catalog).to be_a Scryfall::Catalog
    end
  end

  describe "artist_names" do
    it "returns a Catalog object" do
      catalog = Scryfall::Catalog.artist_names
      expect(catalog).to be_a Scryfall::Catalog
    end
  end

  describe "word_bank" do
    it "returns a Catalog object" do
      catalog = Scryfall::Catalog.word_bank
      expect(catalog).to be_a Scryfall::Catalog
    end
  end

  describe "creature_types" do
    it "returns a Catalog object" do
      catalog = Scryfall::Catalog.creature_types
      expect(catalog).to be_a Scryfall::Catalog
    end
  end

  describe "planeswalker_types" do
    it "returns a Catalog object" do
      catalog = Scryfall::Catalog.planeswalker_types
      expect(catalog).to be_a Scryfall::Catalog
    end
  end

  describe "land_types" do
    it "returns a Catalog object" do
      catalog = Scryfall::Catalog.land_types
      expect(catalog).to be_a Scryfall::Catalog
    end
  end

  describe "artifact_types" do
    it "returns a Catalog object" do
      catalog = Scryfall::Catalog.artifact_types
      expect(catalog).to be_a Scryfall::Catalog
    end
  end

  describe "enchantment_types" do
    it "returns a Catalog object" do
      catalog = Scryfall::Catalog.enchantment_types
      expect(catalog).to be_a Scryfall::Catalog
    end
  end

  describe "spell_types" do
    it "returns a Catalog object" do
      catalog = Scryfall::Catalog.spell_types
      expect(catalog).to be_a Scryfall::Catalog
    end
  end

  describe "powers" do
    it "returns a Catalog object" do
      catalog = Scryfall::Catalog.powers
      expect(catalog).to be_a Scryfall::Catalog
    end
  end

  describe "toughness" do
    it "returns a Catalog object" do
      catalog = Scryfall::Catalog.toughnesses
      expect(catalog).to be_a Scryfall::Catalog
    end
  end

  describe "loyalties" do
    it "returns a Catalog object" do
      catalog = Scryfall::Catalog.loyalties
      expect(catalog).to be_a Scryfall::Catalog
    end
  end

  describe "watermarks" do
    it "returns a Catalog object" do
      catalog = Scryfall::Catalog.watermarks
      expect(catalog).to be_a Scryfall::Catalog
    end
  end
end
