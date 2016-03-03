require 'meetup_wrapper/configuration'
require 'meetup_wrapper/client'

# Module encapsulating MeetupWrapper specific code
module MeetupWrapper
  class << self
    attr_reader :config

    def configure(&_block)
      yield @config ||= ::MeetupWrapper::Configuration.new
    end

    # Alias for MeetupWrapper::Client.new
    # @return [MeetupWrapper::Client]
    def client
      MeetupWrapper::Client.new
    end
  end
end
