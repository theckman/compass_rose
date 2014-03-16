# -*- coding: UTF-8 -*-
# -*- coding: UTF-8 -*-
require 'rspec'
require 'simplecov'
require 'coveralls'

$LOAD_PATH.unshift '.' unless $LOAD_PATH.include?('.')

def repo_root
  File.expand_path('../../..', __FILE__)
end

SimpleCov.formatter = Coveralls::SimpleCov::Formatter
SimpleCov.start do
  add_filter '/spec/'
end

require 'compass_rose'
