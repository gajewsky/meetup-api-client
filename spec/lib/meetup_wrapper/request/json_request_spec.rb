require 'spec_helper'

describe ::MeetupWrapper::Request::JsonRequest do
  subject { ::MeetupWrapper::Request::JsonRequest.new(response_body) }
  let(:response_body) do
    { 'response' => 'hello' }.to_json
  end

  describe '#format_response' do
    let(:expected_json) do
      { 'response' => 'hello' }
    end

    it 'formats the response from meetup' do
      expect(subject.format_response(response_body)).to eq expected_json
    end
  end
end
