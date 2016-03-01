module Meetup
  class Client
    # Defines methods related to events
    module Groups
      def group(urlname)
        get(urlname)
      end
    end
  end
end
