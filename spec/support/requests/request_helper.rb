module Requests
  module RequestHelper
    def get_with_token(path, params = {}, headers = {})
      headers['Accept'] = 'application/json'
      get path, params: params, headers: headers
    end

    def json_response
      JSON.parse(response.body)
    end
  end
end
