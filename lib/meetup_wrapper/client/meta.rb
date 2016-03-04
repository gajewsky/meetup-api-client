module MeetupWrapper
  class Client
    # Defines methods related to Meetup Meta
    module Meta
      # Returns information about Meetup Api Status
      # @return [Hash] The requested group information
      # @example Returns information for the Meetup Api status
      #   MeetupWrapper.client.status
      #     =>  { "status": "ok" }
      def status
        get('status')
      end
    end
  end
end
