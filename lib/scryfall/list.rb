module Scryfall

  class List < SimpleDelegator
    attr_reader :has_more, :next_page, :total_cards, :warnings

    def initialize(contents, klass)
      @has_more    = contents["has_more"]
      @next_page   = contents["next_page"]
      @total_cards = contents["total_cards"]
      @warnings    = contents["warnings"]

      data = contents["data"].map do |obj|
        klass.new obj.to_hash
      end

      super(data)
    end
  end

  class Search < Client

    class << self

      def search(url, klass, params)
        data = JSON.parse(connection.get(url, params).body)
        p data
        List.new(data, klass)
      end
    end
  end
end