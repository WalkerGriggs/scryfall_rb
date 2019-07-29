module Scryfall

  class Card < Client

    class << self

      # Returns a List contained Cards found using a fulltext search string. This string supports the same fulltext
      # search system that the main site uses. (https://scryfall.com/docs/syntax)
      # https://scryfall.com/docs/api/cards/search
      #
      # @param q       [String] A fulltext search query. Make sure that your parameter is properly encoded.
      # @param unique  [String] Specifies if Scryfall should remove "duplicate" results in your query. (cards, art
      #                         prints)
      # @param order   [String] The method to sort returned cards. (name, set, released, rarity, color, usd, tix, eur,
      #                         cmc, power, toughness, edhrec, artist)
      # @param dir     [String] The direction to sort cards. (auto, asc, desc)
      # @param include_extras [Boolean] If true, extra cards (tokens, planes, etc.) will be included. Equivalent to
      #                          adding include:extras to the fulltext search. Defaults to false.
      # @param include_multilingual [Boolean] If true, cards in every language supported by Scryfall will be included.
      # @param include_variations [Boolean] If true, rare care variations will be included. (Hairy Runesword, etc)
      # @param page    [Integer] The apge number to return
      # @param format  [String] The data format to return (json or csv)
      # @param pretty  [Boolean] If true, the returned JSON will be prettified. Avoid using for production code.
      def search(q, unique: "cards", order: "name", dir: "auto", include_extras: false, include_multilingual: false, include_variations: false, page: 1, format: "json", pretty: false)
        params = {
            q: q,
            unique: unique,
            order: order,
            dir: dir,
            include_extras: include_extras,
            include_multilingual: include_multilingual,
            include_variations: include_variations,
            page: page,
            format: format,
            pretty: pretty
        }

        req = Request.new(params = params,
                          headers = nil,
                          body = nil)

        Scryfall::Search.get("/cards/search", self, req)
      end

      # Returns a Card based on a name search string.
      # https://scryfall.com/docs/api/cards/named
      #
      # @param name    [String] Name of the card to retrieve
      # @param mode    [String] The level of search specificity ('exact' or 'fuzzy')
      # @param set     [String] A set code to limit the search to one set.
      # @param format  [String] The data format to return (json, text, or image)
      # @param face    [String] If using the image format and this parameter has the value 'back', the back of the card
      #                         will be returned. Will return a 404 if this card has no back face.
      # @param version [String] The image version to return when using the 'image' format (small, normal, large, png,
      #                         art_crop, or border_crop)
      # @param pretty [Boolean] If true, the returned JSON will be prettified. Avoid using for production code.
      def named(name: nil, mode: "exact", set: nil, format: "json", face: nil, version: "large", pretty: false)
        params = {
            mode => name,
            set: set,
            format: format,
            face: face,
            version: version,
            pretty: pretty
        }

        req = Request.new(params = params,
                          headers = nil,
                          body = nil)

        Scryfall::Card.new JSON.parse(connection.get("/cards/named", req).body)
      end

      # Returns a single, random Card object.
      # https://scryfall.com/docs/api/cards/random
      #
      # @param q       [String] An optional fulltext search query to filter the pool of random cards. Make sure that
      #                         your parameter is properly encoded (https://en.wikipedia.org/wiki/Percent-encoding)
      # @param format  [String] The data format to return (json, text, or image)
      # @param face    [String] If using the image format and this parameter has the value 'back', the back of the card
      #                         will be returned. Will return a 404 if this card has no back face.
      # @param version [String] The image version to return when using the 'image' format (small, normal, large, png,
      #                         art_crop, or border_crop)
      # @param pretty [Boolean] If true, the returned JSON will be prettified. Avoid using for production code.      # @param face    [String]
      def random(q: nil, format: "json", face: nil, version: "large", pretty: false)
        params = {
            q: q,
            format: format,
            face: face,
            version: version,
            pretty: pretty
        }

        req = Request.new(params = params,
                          headers = nil,
                          body = nil)

        Scryfall::Card.new JSON.parse(connection.get("/cards/random", req).body)
      end

      # Accepts a JSON array of card identifiers, and returns a List object with the collection of requested cards.
      # A maximum of 75 card references may be submitted per request.
      # https://scryfall.com/docs/api/cards/collection
      #
      # @param identifiers [Array] An array of JSON objects, each one a card identifier.
      # @param pretty  [Boolean] If true, the returend JSON will be prettified. Avoid using for production code.
      def collection(identifiers, pretty: false)
        req = Request.new(params = nil,
                          headers = {'Content-Type' => 'application/json'},
                          body = identifiers)

        Scryfall::Search.post("/cards/collection", self, req)
      end

      # Returns a single card with the given Scryfall ID.
      # https://scryfall.com/docs/api/cards/id
      #
      # @param id [String] ID of the card to retrieve
      # @return [Scryfall::Card] the card
      def by_id(id)
        req = Request.new(params = nil,
                          headers = nil,
                          body = nil)

        Scryfall::Card.new JSON.parse(connection.get("/cards/#{id}", req).body)
      end
    end
  end
end
