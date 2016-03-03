module Meetup
  # Module encapsulating api calling specific logic
  module Request
    # HTTP request
    class HttpRequest
      # Default charset
      CHARSET = 'UTF-8'.freeze

      def initialize(uri, method = 'get')
        @in_uri = uri
        @method = method
      end

      # Triggers HTTP request
      # @return [JSON] response from api
      def make_request
        uri = URI.parse(@in_uri)
        http = Net::HTTP.new(uri.host, uri.port)
        response = http.request(class_to_call.new(uri.request_uri, headers))
        response.body
      end

      private

      # Prepares HTTP Headers
      def headers
        { 'Accept-Charset' => CHARSET }
      end

      # @return [Symbol] class name
      def class_to_call
        Net::HTTP.const_get(@method.capitalize)
      end
    end
  end
end
