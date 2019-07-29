module Scryfall
  class Catalog < Client

    attr_reader :uri, :total_values, :data

    def initialize(contents)
      @uri = contents["uri"]
      @total_values = contents["total_values"]
      @data = contents["data"]
    end

    class << self

      # Returns a Catalog of all nontoken English card names in Scryfall's database.V
      # https://scryfall.com/docs/api/catalogs/card-names
      #
      # @param format  [String] The data format to return. This method only supports json.
      # @param pretty  [Boolean] If true, the returned JSON will be prettified. Avoid using for production code.
      def card_names(format: "json", pretty: false)
        request_catalogue("/catalog/card-names", format, pretty)
      end

      # Returns a Catalog of all canonical artist names in Scryfall's database.
      # https://scryfall.com/docs/api/catalogs/artist-names
      #
      # @param format  [String] The data format to return. This method only supports json.
      # @param pretty  [Boolean] If true, the returned JSON will be prettified. Avoid using for production code.
      def artist_names(format: "json", pretty: false)
        request_catalogue("/catalog/artist-names", format, pretty)
      end

      # Returns a Catalog of all English words, of length 2 or more, that could appear in a card name.
      # https://scryfall.com/docs/api/catalogs/word-bank
      #
      # @param format  [String] The data format to return. This method only supports json.
      # @param pretty  [Boolean] If true, the returned JSON will be prettified. Avoid using for production code.
      def word_bank(format: "json", pretty: false)
        request_catalogue("/catalog/word-bank", format, pretty)
      end

      # Returns a Catalog of all creature types in Scryfall's database.
      # https://scryfall.com/docs/api/catalogs/creature-types
      #
      # @param format  [String] The data format to return. This method only supports json.
      # @param pretty  [Boolean] If true, the returned JSON will be prettified. Avoid using for production code.
      def creature_types(format: "json", pretty: false)
        request_catalogue("/catalog/creature-types", format, pretty)
      end

      # Returns a Catalog of all planeswalker types in Scryfall's database
      # https://scryfall.com/docs/api/catalogs/planeswalker-types
      #
      # @param format  [String] The data format to return. This method only supports json.
      # @param pretty  [Boolean] If true, the returned JSON will be prettified. Avoid using for production code.
      def planeswalker_types(format: "json", pretty: false)
        request_catalogue("/catalog/planeswalker-types", format, pretty)
      end

      # Returns a Catalog of all land types in Scryfall's database
      # https://scryfall.com/docs/api/catalogs/land-types
      #
      # @param format  [String] The data format to return. This method only supports json.
      # @param pretty  [Boolean] If true, the returned JSON will be prettified. Avoid using for production code.
      def land_types(format: "json", pretty: false)
        request_catalogue("/catalog/land-types", format, pretty)
      end

      # Returns a Catalog of all artifact types in Scryfall's database
      # https://scryfall.com/docs/api/catalogs/artifact-types
      #
      # @param format  [String] The data format to return. This method only supports json.
      # @param pretty  [Boolean] If true, the returned JSON will be prettified. Avoid using for production code.
      def artifact_types(format: "json", pretty: false)
        request_catalogue("/catalog/artifact-types", format, pretty)
      end

      # Returns a Catalog of all enchantment types in Scryfall's database
      # https://scryfall.com/docs/api/catalogs/enchantment-types
      #
      # @param format  [String] The data format to return. This method only supports json.
      # @param pretty  [Boolean] If true, the returned JSON will be prettified. Avoid using for production code.
      def enchantment_types(format: "json", pretty: false)
        request_catalogue("/catalog/enchantment-types", format, pretty)
      end

      # Returns a Catalog of all spell types in Scryfall's database
      # https://scryfall.com/docs/api/catalogs/spell-types
      #
      # @param format  [String] The data format to return. This method only supports json.
      # @param pretty  [Boolean] If true, the returned JSON will be prettified. Avoid using for production code.
      def spell_types(format: "json", pretty: false)
        request_catalogue("/catalog/spell-types", format, pretty)
      end

      # Returns a Catalog of all possible values for a creature or vehicle's power in Scryfall's database
      # https://scryfall.com/docs/api/catalogs/powers
      #
      # @param format  [String] The data format to return. This method only supports json.
      # @param pretty  [Boolean] If true, the returned JSON will be prettified. Avoid using for production code.
      def powers(format: "json", pretty: false)
        request_catalogue("/catalog/powers", format, pretty)
      end

      # Returns a Catalog of all possible values for a creature or vehicle's toughness in Scryfall's database
      # https://scryfall.com/docs/api/catalogs/toughnesses
      #
      # @param format  [String] The data format to return. This method only supports json.
      # @param pretty  [Boolean] If true, the returned JSON will be prettified. Avoid using for production code.
      def toughnesses(format: "json", pretty: false)
        request_catalogue("/catalog/toughnesses", format, pretty)
      end

      # Returns a Catalog of all possible values for a planeswalker's loyalty in Scryfall's database
      # https://scryfall.com/docs/api/catalogs/loyalties
      #
      # @param format  [String] The data format to return. This method only supports json.
      # @param pretty  [Boolean] If true, the returned JSON will be prettified. Avoid using for production code.
      def loyalties(format: "json", pretty: false)
        request_catalogue("/catalog/loyalties", format, pretty)
      end

      # Returns a Catalog of all watermarks in Scryfall's database
      # https://scryfall.com/docs/api/catalogs/loyalties
      #
      # @param format  [String] The data format to return. This method only supports json.
      # @param pretty  [Boolean] If true, the returned JSON will be prettified. Avoid using for production code.
      def watermarks(format: "json", pretty: false)
        request_catalogue("/catalog/watermarks", format, pretty)
      end

      # Forms Request and calls connection. Used to DRY out the preceding catalog API.
      #
      # @param format  [String] The data format to return. This method only supports json.
      # @param pretty  [Boolean] If true, the returned JSON will be prettified. Avoid using for production code.
      def request_catalogue(path, format, pretty)
        req = Request.new(
            params = {format: format, pretty: pretty},
            headers = nil,
            body = nil)

        Scryfall::Catalog.new JSON.parse(connection.get(path, req).body)
      end

    end
  end
end