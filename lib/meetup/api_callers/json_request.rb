require 'meetup/api_callers/http_request'
require 'json'
module Meetup
  module ApiCallers
    # JSON request
    class JsonRequest < HttpRequest
      def format_response(response_body)
        JSON.parse(response_body)
      end
    end
  end
end
