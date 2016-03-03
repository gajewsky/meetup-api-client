module MeetupWrapper
  class Client
    # Defines methods related to Meetup Groups
    module Groups
      # Returns information about single Meetup Group
      # @param urlname [String] An Meetup group ID
      # @return [Hash] The requested group information
      # @example Return information for the Meetup group
      #   MeetupWrapper.client.group('Krakow-Ruby-Users-Group')
      #     =>  {"id"=>6594592, "name"=>"Krakow Ruby User Group (KRUG)"...}
      def group(urlname)
        get(urlname)
      end
    end
  end
end
