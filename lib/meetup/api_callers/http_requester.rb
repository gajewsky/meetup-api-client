require 'net/http'

module Meetup
  # Module encapsulating api calling specific logics
  module ApiCallers
    # HTTP requester
    class HttpRequester
      def initialize(requester)
        @requester = requester
      end

      # Executes request
      def execute_request
        @requester.make_request
      end
    end
  end
end
