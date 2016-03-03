require 'net/http'

module MeetupWrapper
  # Module encapsulating api calling specific logics
  module Request
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
