require 'bundler'
require 'rake'
require 'polishgeeks-dev-tools'

Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)
task default: :spec

PolishGeeks::DevTools.setup do |config|
  config.brakeman = false
  config.haml_lint = false
  config.simplecov = false
end

desc 'Self check using strike-dev-tools'
task :check do
  PolishGeeks::DevTools::Runner.new.execute(
    PolishGeeks::DevTools::Logger.new
  )
end

task default: :check
