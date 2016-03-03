require 'meetup_wrapper/request/json_request'
require 'meetup_wrapper/request/http_requester'

module MeetupWrapper
  # Defines HTTP request methods
  module Request
    # Base Url for accessing meetup api
    BASE_URL = 'http://api.meetup.com/'.freeze

    # Performs an HTTP GET request
    # @param path [String] request path
    # @param params [Hash] Hash with HTTP parameters
    def get(path, params = {})
      json_request = JsonRequest.new(remote_url(path, params))
      requester = HttpRequester.new(json_request)
      requester.execute_request
    end

    private

    # Prepares remote url
    # @param path [String] request path
    # @param params [Hash] Hash with HTTP parameters
    # @return [String] prepared url
    def remote_url(path, params)
      "#{BASE_URL}#{path}?#{query_string(params)}"
    end

    # Prepares params query
    # @param params [Hash] Hash with HTTP parameters
    # @return [String] prepared params query
    def query_string(params)
      params
        .merge(key: ::MeetupWrapper.config.api_key)
        .map { |k, v| "#{k}=#{v}" }
        .join('&')
    end
  end
end
