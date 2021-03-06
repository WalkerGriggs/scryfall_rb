require "delegate"
require "httparty"

require "request/request"
require "scryfall/version"
require "scryfall/configuration"
require "scryfall/errors"
require "scryfall/client"
require "scryfall/connection"
require "scryfall/card"
require "scryfall/catalog"
require "scryfall/set"
require "scryfall/list"

module Scryfall
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
