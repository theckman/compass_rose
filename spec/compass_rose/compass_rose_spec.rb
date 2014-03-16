# -*- coding: UTF-8 -*-
require 'spec_helper'
require 'ap'

describe Compass::Rose do

  describe '::VERSION' do
    subject { Compass::Rose::VERSION }

    it { should be_an_instance_of String }

    it 'should match a simple semver regex' do
      m = /^\d+\.\d+\.\d+$/
      expect(m.match(subject)).not_to be_nil
    end
  end

  describe '.direction' do
    it 'should take no more than two args' do
      expect do
        Compass::Rose.direction(nil, nil, nil)
      end.to raise_error ArgumentError
    end

    it 'should take no less than two args' do
      expect do
        Compass::Rose.direction(nil)
      end.to raise_error ArgumentError
    end

    context 'when given valid bearing' do
      subject { Compass::Rose.direction(42, 32) }

      it { should be_an_instance_of Hash }
    end
  end
end
