require 'meetup/request/http_request'
require 'json'
require 'pry'

module Meetup
  # Module encapsulating api calling specific logic
  module Request
    # JSON request
    class JsonRequest < HttpRequest
      # Parse response
      # @param response_body [JSON] JSON response from api
      # @return [Hash] parsed response
      def format_response(response_body)
        JSON.parse(response_body)
      end
    end
  end
end
