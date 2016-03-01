# Meetup Client Ruby Gem

A Ruby wrapper for the http://www.meetup.com/meetup_api/ .

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'meetup'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install meetup

## Setup
Create a new file config/initializers/meetup.rb, and put the following content in it:

```ruby
Meetup.configure do |config|
  config.api_key = MEETUP_API_KEY
end
```

## Usage Examples

**To get information about Krakow-Ruby-Users-Group**

```ruby
    client = Meetup.client
    group = client.group('Krakow-Ruby-Users-Group')
```
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/meetup-api-client. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
