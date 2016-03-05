require 'meetup_wrapper/request/http_request'
require 'json'
require 'hashie'
require 'pry'

module MeetupWrapper
  # Module encapsulating api calling specific logic
  module Request
    # JSON request
    class JsonRequest < HttpRequest
      # Formats response
      # @param response_body [String] JSON response from api
      # @return [Hashie::Mash], [Array<Hashie::Mash>] whether json response is array or not
      def format_response(response_body)
        json_array = [JSON.parse(response_body)]
        parsed_body = json_array.flatten.map { |hash| Hashie::Mash.new(hash) }
        # if array contain only one element then return it
        parsed_body.size == 1 ? parsed_body.first : parsed_body
      end
    end
  end
end
