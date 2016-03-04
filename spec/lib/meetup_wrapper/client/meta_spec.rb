require 'spec_helper'

describe MeetupWrapper::Client do
  subject { MeetupWrapper.client }
  let(:api_key) { Faker::Lorem.word }
  let(:response) { '{"status":"ok" }' }
  let(:epected_response) { { 'status' => 'ok' } }

  before { MeetupWrapper.configure { |config| config.api_key = api_key } }

  describe '#status' do
    before do
      stub_request(:get, "api.meetup.com/status?key=#{api_key}")
        .to_return(body: response, status: 200, headers: {})
    end

    it 'returns status information' do
      expect(subject.status).to eq epected_response
    end
  end
end
