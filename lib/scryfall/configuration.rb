module Scryfall

  class Configuration
    def initialize
      @logger = Logger.new(STDOUT)
    end
  end
end
