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

      # Returns a Meetup Event by urlname and event_id
      # @param urlname [String] An Meetup group ID
      # @param event_id [String] An Meetup event ID
      # @param options [Hash] options hash
      # @return [Hashie::Mash] The response includes list of events
      # @example Return information for the Meetup event
      #   client.group_events("Krakow-Ruby-Users-Group", '229382749')
      #     =>  #<Hashie::Mash category=#<Hashie::Mash id=34 name="Tech" ...
      # @see http://www.meetup.com/meetup_api/docs/:urlname/events/:id/#get
      def group_event(urlname, event_id, options = {})
        get("#{urlname}/events/#{event_id}", options)
      end
    end
  end
end
