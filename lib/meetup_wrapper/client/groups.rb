module MeetupWrapper
  class Client
    # Defines methods related to Meetup Groups
    module Groups
      # Returns information about single Meetup Group
      # @param urlname [String] An Meetup group ID
      # @param options [Hash] options hash
      # @return [Hashie::Mash] The response includes group information
      # @example Return information for the Meetup group
      #   group = client.group("Krakow-Ruby-Users-Group")
      #     =>  #<Hashie::Mash category=#<Hashie::Mash id=34 name="Tech" ...
      #   group.id
      #     => 6594592
      # @see http://www.meetup.com/meetup_api/docs/:urlname/#get
      def group(urlname, options = {})
        get(urlname, options)
      end

      # Renders a list of similar groups
      # @param urlname [String] An Meetup group ID
      # @param options [Hash] options hash
      # @return [Hashie::Mash] The response includes a list of similar groups
      # @example Return information for the Meetup group
      #   client.similar_groups('Krakow-Ruby-Users-Group')
      #     =>  [#<Hashie::Mash>]
      # @see http://www.meetup.com/meetup_api/docs/:urlname/similar_groups/
      def similar_groups(urlname, options = {})
        get("#{urlname}/similar_groups", options)
      end

      # Returns groups Meetup finds relevant to you
      # @param options [Hash] options hash
      # @return [Hashie::Mash] The response includes a list of similar groups
      # @example Return information for the Meetup group
      #   client.recommended_groups
      #     =>  [#<Hashie::Mash>]
      # @see http://www.meetup.com/meetup_api/docs/recommended/groups/
      def recommended_groups(options = {})
        get('recommended/groups', options)
      end

      # Returns text, location, category and friend-based group searches
      # @param options [Hash] options hash
      # @return [Hashie::Mash] The response includes a list of similar groups
      # @example Return information for the Meetup group
      #   client.find_groups('ruby')
      #     =>  [#<Hashie::Mash>]
      # @see http://www.meetup.com/meetup_api/docs/find/groups/
      def find_groups(text, options = {})
        get('find/groups', options.merge(text: text))
      end
    end
  end
end
