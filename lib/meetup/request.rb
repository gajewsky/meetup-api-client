require 'meetup/api_callers/json_request'
require 'meetup/api_callers/http_requester'

module Meetup
  # Defines HTTP request methods
  module Request
    BASE_URL = 'http://api.meetup.com/'.freeze

    # Perform an HTTP GET request
    def get(path, params = {})
      json_request = ApiCallers::JsonRequest.new(remote_url(path, params))
      requester = ApiCallers::HttpRequester.new(json_request)
      requester.execute_request
    end

    private

    # Prepare remote url
    def remote_url(path, params)
      "#{BASE_URL}#{path}?#{query_string(params)}"
    end

    def query_string(params)
      params
        .merge(key: ::Meetup.config.api_key)
        .map { |k, v| "#{k}=#{v}" }
        .join('&')
    end
  end
end
