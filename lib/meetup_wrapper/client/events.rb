module MeetupWrapper
  class Client
    # Defines methods related to Meetup Events
    module Events
      # Returns a listing of all Meetup Events a target hosted by a target group
      # @param urlname [String] An Meetup group ID
      # @param options [Hash] options hash
      # @return [Hashie::Mash] The response includes list of events
      # @example Return information for the Meetup group
      #   client.group_events("Krakow-Ruby-Users-Group")
      #     =>  #<Hashie::Mash category=#<Hashie::Mash id=34 name="Tech" ...
      # @see http://www.meetup.com/meetup_api/docs/:urlname/events/#list
      def group_events(urlname = 'self', options = {})
        get("#{urlname}/events", options)
      end
    end
  end
end
