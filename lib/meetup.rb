require 'meetup/configuration'
require 'meetup/client'

# Module encapsulating Meetup specific code
module Meetup
  class << self
    attr_reader :config

    def configure(&_block)
      yield @config ||= ::Meetup::Configuration.new
    end

    # Alias for Meetup::Client.new
    # @return [Meetup::Client]
    def client
      Meetup::Client.new
    end
  end
end
