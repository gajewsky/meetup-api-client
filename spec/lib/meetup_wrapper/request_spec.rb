require 'spec_helper'

describe MeetupWrapper::Request do
  subject { MeetupWrapper.client }
  let(:api_key) { Faker::Lorem.word }
  let(:query_string) { "category=1&status=upcoming&time=0,1m&key=#{api_key}" }
  let(:path) { 'test-path' }
  let(:params) do
    {
      category: '1',
      status: 'upcoming',
      time: '0,1m'
    }
  end

  before { MeetupWrapper.configure { |config| config.api_key = api_key } }

  it 'has set a BASE_URL' do
    expect(MeetupWrapper::Request::BASE_URL).not_to be nil
  end

  describe '#remote_url' do
    before do
      expect(subject)
        .to receive(:query_string)
        .with(params)
        .and_return(query_string)
    end

    it 'returns a valid remote url' do
      expect(
        subject.send(:remote_url, path, params)
      ).to eq "#{MeetupWrapper::Request::BASE_URL}#{path}?#{query_string}"
    end
  end

  describe '#query_string' do
    it 'returns a valid query string' do
      expect(
        subject.send(:query_string, params)
      ).to eq query_string
    end
  end
end
