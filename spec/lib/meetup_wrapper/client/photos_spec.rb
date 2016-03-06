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

  describe '#photo_albums' do
    before do
      stub_request(:get, "#{base_url}#{test_group}/photo_albums?key=#{api_key}")
        .to_return(body: response, status: 200, headers: {})
    end

    it 'returns list of group photo albums' do
      expect(
        subject.photo_albums(test_group)
      ).to eq exp_result
    end
  end
end
