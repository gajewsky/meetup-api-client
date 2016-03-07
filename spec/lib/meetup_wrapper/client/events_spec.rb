require 'spec_helper'

describe MeetupWrapper::Client do
  subject { MeetupWrapper.client }
  let(:base_url) { MeetupWrapper::Request::BASE_URL }
  let(:api_key) { Faker::Lorem.word }
  let(:test_group) { 'group' }
  let(:response) { '{"id":"6594592","name":"group","link":"http://www.meetup.com/group/"}' }
  let(:exp_result) do
    { 'id' => '6594592', 'name' => 'group', 'link' => 'http://www.meetup.com/group/' }
  end

  before { MeetupWrapper.configure { |config| config.api_key = api_key } }

  describe '#group_events' do
    context 'when urlname is passed' do
      before do
        stub_request(:get, "#{base_url}#{test_group}/events?key=#{api_key}")
          .to_return(body: response, status: 200, headers: {})
      end

      it 'returns list of group events' do
        expect(
          subject.group_events(test_group)
        ).to eq exp_result
      end
    end

    context 'when urlname is not passed' do
      before do
        stub_request(:get, "#{base_url}self/events?key=#{api_key}")
          .to_return(body: response, status: 200, headers: {})
      end
      it 'returns list of group events' do
        expect(
          subject.group_events
        ).to eq exp_result
      end
    end
  end

  describe '#group_event' do
    let(:event_id) { '359651' }

    before do
      stub_request(:get, "#{base_url}#{test_group}/events/#{event_id}?key=#{api_key}")
        .to_return(body: response, status: 200, headers: {})
    end

    it 'returns event' do
      expect(
        subject.group_event(test_group, event_id)
      ).to eq exp_result
    end
  end
end
