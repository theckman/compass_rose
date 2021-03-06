# -*- coding: UTF-8 -*-
require 'English'

$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)

require 'compass_rose'

Gem::Specification.new do |g|
  g.name        = 'compass_rose'
  g.version     = Compass::Rose::VERSION
  g.date        = Time.now.strftime('%Y-%m-%d')
  g.description = 'Converts bearings in degrees to human-readable names'
  g.summary     = 'Bearings to human-readable names'
  g.authors     = ['Tim Heckman']
  g.email       = 't@heckman.io'
  g.homepage    = 'https://github.com/theckman/compass_rose'
  g.license     = 'MIT'
  g.required_ruby_version = '>= 1.9.3'

  g.test_files  = `git ls-files spec/*`.split
  g.files       = `git ls-files`.split

  g.add_development_dependency 'bundler', '~> 1.5'
  g.add_development_dependency 'rake', '~> 10.2'
  g.add_development_dependency 'rspec', '~> 3.0'
  g.add_development_dependency 'rubocop', '~> 0.23.0'
  g.add_development_dependency 'fuubar', '>= 2.0.0.rc1'
  g.add_development_dependency 'coveralls', '~> 0.7.0'
end
