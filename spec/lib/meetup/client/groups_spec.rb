require 'spec_helper'

describe Meetup::Client do
  subject { Meetup.client }
  let(:api_key) { Faker::Lorem.word }
  let(:test_group) { 'group-name' }
  let(:response) { '{"id":6594592,"name":"group-name","link":"http://www.meetup.com/group-name/"' }

  before { Meetup.configure { |config| config.api_key = api_key } }

  describe '.group' do
    before do
      stub_request(:get, "api.meetup.com/#{test_group}?key=#{api_key}")
        .to_return(body: response, status: 200, headers: {})
    end

    it 'returns single group information' do
      response = subject.group(test_group)

      expect(response).to eq response
    end
  end
end
