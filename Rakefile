# -*- coding: UTF-8 -*-

require 'rspec/core/rake_task'
require 'rubocop/rake_task'

RSpec::Core::RakeTask.new(:spec)

RuboCop::RakeTask.new(:rubocop) do |t|
  t.patterns =
    %w(compass_rose.gemspec lib/**/*.rb spec/**/*.rb)
  t.fail_on_error = true
end

task default: [:rubocop, :spec]
