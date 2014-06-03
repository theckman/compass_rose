# -*- coding: UTF-8 -*-
require 'spec_helper'
require_relative 'ranges'

describe CompassRose::RoseUtils do
  before do
    @lb = 343.12
    @m = CompassRose::THIRTYTWO
  end

  context '#bearing_nonzero' do
    it 'should take no more than two args' do
      expect do
        CompassRose::RoseUtils.bearing_nonzero(nil, nil, nil)
      end.to raise_error ArgumentError
    end

    it 'should take no less than two args' do
      expect do
        CompassRose::RoseUtils.bearing_nonzero(nil)
      end.to raise_error ArgumentError
    end

    it 'should return an Array' do
      b = CompassRose::RoseUtils.bearing_nonzero(@m, @lb)
      expect(b).to be_an_instance_of Array
    end

    it 'should return the correct values' do
      b = CompassRose::RoseUtils.bearing_nonzero(@m, @lb)
      expect(b[0]).to eql(@lb + 0.01)
      expect(b[1]).to eql(@lb + 11.25)
      expect(b[2]).to eql(@lb + 11.25)
    end
  end

  context '#bearing_zero' do

    it 'should take no more one arg' do
      expect do
        CompassRose::RoseUtils.bearing_zero(nil, nil)
      end.to raise_error ArgumentError
    end

    it 'should take no less than one arg' do
      expect do
        CompassRose::RoseUtils.bearing_zero
      end.to raise_error ArgumentError
    end

    it 'should return an Array' do
      b = CompassRose::RoseUtils.bearing_zero(@m)
      expect(b).to be_an_instance_of Array
    end

    it 'should return the correct values' do
      b = CompassRose::RoseUtils.bearing_zero(@m)
      expect(b[0]).to eql 354.38
      expect(b[1]).to eql 5.62
      expect(b[2]).to eql 5.62
    end
  end

  context '#hashit' do
    let(:hit) { CompassRose::RoseUtils.hashit(@m, 0.00) }

    it 'should take no more than two args' do
      expect do
        CompassRose::RoseUtils.hashit(nil, nil, nil)
      end.to raise_error ArgumentError
    end

    it 'should take no less than two args' do
      expect do
        CompassRose::RoseUtils.hashit(nil)
      end.to raise_error ArgumentError
    end

    it 'should return a Hash' do
      expect(hit).to be_an_instance_of Hash
    end

    it 'should have each key should be a hash' do
      hit.each do |_, v|
        expect(v).to be_an_instance_of Hash
      end
    end

    it 'should have the :low key' do
      hit.each do |_, v|
        expect(v.key?(:low)).to be_truthy
      end
    end

    it 'should have the :high key' do
      hit.each do |_, v|
        expect(v.key?(:high)).to be_truthy
      end
    end
  end

  context '#build_rose' do
    let(:br) { CompassRose::RoseUtils.build_rose(@m) }

    it 'should take no more than one arg' do
      expect do
        CompassRose::RoseUtils.build_rose(nil, nil)
      end.to raise_error ArgumentError
    end

    it 'should take no less than one arg' do
      expect do
        CompassRose::RoseUtils.build_rose
      end.to raise_error ArgumentError
    end

    it 'should return a Hash' do
      expect(br).to be_an_instance_of Hash
    end
  end
end

describe CompassRose::FOUR do
  subject { CompassRose::FOUR }
  it_should_behave_like 'CompassRose::Ranges'
end

describe CompassRose::EIGHT do
  subject { CompassRose::EIGHT }
  it_should_behave_like 'CompassRose::Ranges'
end

describe CompassRose::SIXTEEN do
  subject { CompassRose::SIXTEEN }
  it_should_behave_like 'CompassRose::Ranges'
end

describe CompassRose::THIRTYTWO do
  subject { CompassRose::THIRTYTWO }
  it_should_behave_like 'CompassRose::Ranges'
end

describe CompassRose::RANGES do
  subject { CompassRose::RANGES }

  it 'should be an instance of Hash' do
    expect(subject).to be_an_instance_of Hash
  end

  it 'should have the :four key' do
    expect(subject.key?(:four)).to be_truthy
  end

  it 'should have a :four key which is a Hash' do
    expect(subject[:four]).to be_an_instance_of Hash
  end

  it 'should have the :eight key' do
    expect(subject.key?(:eight)).to be_truthy
  end

  it 'should have an :eight key which is a Hash' do
    expect(subject[:eight]).to be_an_instance_of Hash
  end

  it 'should have the :sixteen key' do
    expect(subject.key?(:sixteen)).to be_truthy
  end

  it 'should have a :sixteen key which is a Hash' do
    expect(subject[:sixteen]).to be_an_instance_of Hash
  end

  it 'should have the :thirtytwo key' do
    expect(subject.key?(:thirtytwo)).to be_truthy
  end

  it 'should have a :thirtytwo key which is a Hash' do
    expect(subject[:thirtytwo]).to be_an_instance_of Hash
  end
end
