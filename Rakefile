require "bundler/gem_tasks"

ENV['gem_push'] = 'off' # Never Push to Rubygems

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
rescue LoadError
end
