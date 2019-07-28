module Scryfall

  class Client

    def initialize(attrs = {})
      @attributes = OpenStruct.new(attrs)
    end

    def to_h
      @attributes.to_h
    end

    # @private
    def method_missing(method, *args, &block)
      attribute = @attributes.send(method, *args, &block)
      attribute.is_a?(Hash) ? Client.new(attribute) : attribute
    end

    def connection
      self.class.connection
    end

    class << self
      def connection
        @@connection ||= Connection.new
      end

      def connection=(conn)
        @@connection = conn
      end
    end
  end
end

