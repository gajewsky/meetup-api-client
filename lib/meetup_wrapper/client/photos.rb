module MeetupWrapper
  class Client
    # Defines methods related to Meetup Photos
    module Photos
      # Returns list a group photo albums in ascending order based on the time they were created
      # @param urlname [String] An Meetup group ID
      # @param options [Hash] options hash
      # @return [Hashie::Mash] The response includes list of photos
      # @example Return list of group photo albums
      #   client.photo_albums("Krakow-Ruby-Users-Group")
      #     =>  #<Hashie::Mash category=#<Hashie::Mash id=34 name="Tech" ...
      # @see http://www.meetup.com/meetup_api/docs/:urlname/events/#list
      def photo_albums(urlname, options = {})
        get("#{urlname}/photo_albums", options)
      end
    end
  end
end
