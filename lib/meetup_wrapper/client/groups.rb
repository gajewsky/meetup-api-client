module MeetupWrapper
  class Client
    # Defines methods related to Meetup Groups
    module Groups
      # Returns information about single Meetup Group
      # @param urlname [String] An Meetup group ID
      # @return [Hashie::Mash] The response includes group information
      # @example Return information for the Meetup group
      #   group = client.group("Krakow-Ruby-Users-Group")
      #     =>  #<Hashie::Mash category=#<Hashie::Mash id=34 name="Tech" ...
      #   group.id
      #     => 6594592
      def group(urlname)
        get(urlname)
      end

      # Renders a list of similar groups
      # @param urlname [String] An Meetup group ID
      # @return [Hashie::Mash] The response includes a list of similar groups
      # @example Return information for the Meetup group
      #   client.similar_groups('Krakow-Ruby-Users-Group')
      #     =>  "[{\"id\":17716742,\"name\":\"Cracow R User Group "...}
      def similar_groups(urlname)
        get("#{urlname}/similar_groups")
      end
    end
  end
end
