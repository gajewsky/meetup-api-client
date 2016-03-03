lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'meetup_wrapper/version'

Gem::Specification.new do |s|
  s.name          = "meetup-wrapper"
  s.version       = MeetupWrapper::VERSION
  s.platform      = Gem::Platform::RUBY
  s.authors       = %w( "Marcin Gajewski" )
  s.email         = %w( "marcin.marek.gajewski@gmail.com" )
  s.homepage      = "https://github.com/gajewsky/meetup-api-client"

  s.summary       = %q{ Meetup Client Ruby Gem. }
  s.description   = %q{ A Ruby wrapper for the http://www.meetup.com/meetup_api }
  s.license       = "MIT"

  s.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  s.require_paths = %w( "lib" )

  s.add_development_dependency "bundler"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "webmock"
  s.add_development_dependency "pry"
end
