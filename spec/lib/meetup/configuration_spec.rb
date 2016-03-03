require 'spec_helper'

describe Meetup::Configuration do
  it 'has api_key attr_accessor' do
    expect(subject).to respond_to(:api_key)
    expect(subject).to respond_to(:api_key=)
  end
end
