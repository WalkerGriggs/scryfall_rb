class Request
  attr_accessor :params, :headers, :body

  def initialize(params, headers=nil, body=nil)
    @params = params
    @headers = headers
    @body = body
  end
end