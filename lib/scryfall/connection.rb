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

    def get(path, params = {}, headers=nil, body=nil)
      request :get, path, params, headers, body
    end

    def post(path, params = {}, headers=nil, body=nil)
      request :post, path, params, headers, body
    end

    def request(verb, path, params = {}, headers=nil, body=nil)
      raise ArgumentError.new "Invalid HTTP verb #{verb}" if ![:get, :post].include?(verb)

      response = begin
        self.class.public_send verb, path, query: params, headers: headers, body: body # debug_output: $stdout
      end

      status = response.respond_to?(:status) ? response.status : response.code
      response
    end
  end
end
