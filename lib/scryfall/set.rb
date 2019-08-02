module Scryfall

  class Set < Client

    class << self

      # Returns a List object of all Sets on Scryfall
      # https://scryfall.com/docs/api/sets/all
      #
      # @param format  [String] The data format to return. This method only supports json.
      # @param pretty  [Boolean] If true, the returned JSON will be prettified. Avoid using for production code.
      def all(format: "json", pretty: false)
        req = Request.new(
            params: {format: format, pretty: pretty},
            headers: nil,
            body: nil)

        Scryfall::Search.get("/sets", self, req)
      end

      # Returns a Set with the given set code. The code can be either the code or the mtgo_code for the set.
      # https://scryfall.com/docs/api/sets/code
      #
      # @param code    [String] The three to five letter set code
      # @param format  [String] The data format to return. This method only supports json.
      # @param pretty  [Boolean] If true, the returned JSON will be prettified. Avoid using for production code.
      def code(code, format: "json", pretty: false)
        req = Request.new(
            params: {format: format, pretty: pretty},
            headers: nil,
            body: nil)

        Scryfall::Set.new JSON.parse(connection.get("/sets/#{code}", req).body)
      end

      # Returns a Set with the given Scryfall ID.
      # https://scryfall.com/docs/api/sets/id
      #
      # @param id      [String] The Scryfall set ID
      # @param format  [String] The data format to return. This method only supports json.
      # @param pretty  [Boolean] If true, the returned JSON will be prettified. Avoid using for production code.
      def id(id, format: "json", pretty: false)
        req = Request.new(
            params: {format: format, pretty: pretty},
            headers: nil,
            body: nil)

        Scryfall::Set.new JSON.parse(connection.get("/sets/#{id}", req).body)
      end
    end
  end
end