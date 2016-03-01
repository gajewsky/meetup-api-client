require File.expand_path('../request', __FILE__)

module Meetup
  # Wrapper for the Meetup REST API
  class Client
    include Request

    base_path = File.dirname(__FILE__) + '/client/*.rb'
    Dir[base_path].each { |file| require file }

    include Groups
  end
end
