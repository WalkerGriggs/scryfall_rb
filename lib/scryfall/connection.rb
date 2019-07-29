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

    def get(path, req)
      request :get, path, req
    end

    def post(path, req)
      request :post, path, req
    end

    def request(verb, path, req)
      raise ArgumentError.new "Invalid HTTP verb #{verb}" unless [:get, :post].include?(verb)

      response = begin
        self.class.public_send verb, path, query: req.params, headers: req.headers, body: req.body # debug_output: $stdout
      end

      status = response.respond_to?(:status) ? response.status : response.code
      case status
      when 404
        raise Scryfall::NotFoundError.new(error_details(response))
      else
        raise Scryfall::Error.new(error_details(response))
      end

      response
    end

    def error_details(response)
      JSON.parse(response.body)["details"]
    end
  end
end
