module Scryfall

  class Connection
    include HTTParty
    
    DEFAULT_VERSION = "v1"
  
    DEFAULT_API_BASE_URI = "https://api.scryfall.com"

    def initialize(version: DEFAULT_VERSION, api_base_uri: DEFAULT_API_BASE_URI)
      @api_version = version
      @api_base_uri = api_base_uri

      Scryfall::Connection.base_uri @api_base_uri
    end

    def get(path, params = {})
      request :get, path, params
    end

    def post(path, params = {})
      request :post, path, params
    end

    def request(verb, path, params = {})
      raise ArgumentError.new "Invalid HTTP verb #{verb}" if ![:get, :post].include?(verb)

      headers = {
        "Accept-Version" => @api_version
      }

      response = begin
        self.class.public_send verb, path, query: params
      end

      status = response.respond_to?(:status) ? response.status : response.code
      response
    end
  end
end
