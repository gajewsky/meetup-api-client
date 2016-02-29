require 'meetup/configuration'
require 'meetup/client'

# Module encapsulating Meetup specific code
module Meetup
  class << self
    attr_reader :config

    def configure(&_block)
      yield @config ||= ::Meetup::Configuration.new
    end
  end
end
