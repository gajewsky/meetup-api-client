require 'net/http'

module Meetup
  module ApiCallers
    # HTTP requester
    class HttpRequester
      def initialize(requester)
        @requester = requester
      end

      def execute_request
        @requester.make_request
      end
    end
  end
end
