# -*- coding: UTF-8 -*-
require 'spec_helper'

describe CompassRose::Direction do
  let(:direction) { described_class }

  context '#check_else' do
    let(:ranges) { CompassRose::RANGES[:thirtytwo] }

    it 'should accept no more than two args' do
      expect do
        direction.check_else(nil, nil, nil)
      end.to raise_error ArgumentError
    end

    it 'should accept no less than two args' do
      expect do
        direction.check_else(nil)
      end.to raise_error ArgumentError
    end

    it 'should return true if it is within the south range' do
      r = ranges[:south]
      expect(direction.check_else(180, r)).to be_truthy
    end

    it 'should return false if it is outside the southern range' do
      r = ranges[:south]
      expect(direction.check_else(0, r)).to be_falsey
    end
  end

  context '#check_north' do
    let(:ranges) { CompassRose::RANGES[:thirtytwo] }

    it 'should accept no more than two args' do
      expect do
        direction.check_north(nil, nil, nil)
      end.to raise_error ArgumentError
    end

    it 'should accept no less than two args' do
      expect do
        direction.check_north(nil)
      end.to raise_error ArgumentError
    end

    it 'should return true if it is within the north range' do
      r = ranges[:north]
      expect(direction.check_north(0, r)).to be_truthy
    end

    it 'should return false if it is outside the north range' do
      r = ranges[:north]
      expect(direction.check_north(180, r)).to be_falsey
    end
  end

  context '#find_direction' do
    let(:ranges) { CompassRose::RANGES[:thirtytwo] }
    let(:fdir) { direction.find_direction(0, ranges) }

    it 'should accept no more than two args' do
      expect do
        direction.find_direction(nil, nil, nil)
      end.to raise_error ArgumentError
    end

    it 'should accept no less than two args' do
      expect do
        direction.find_direction(nil)
      end.to raise_error ArgumentError
    end

    it 'should return a symbol' do
      expect(fdir).to be_an_instance_of Symbol
    end

    it 'should return the proper direction' do
      expect(direction.find_direction(90, ranges)).to eql :east
    end
  end

  context '#points_to_sym' do
    it 'should accept no more than one arg' do
      expect do
        direction.points_to_sym(nil, nil)
      end.to raise_error ArgumentError
    end

    it 'should accept no less than one arg' do
      expect do
        direction.points_to_sym
      end.to raise_error ArgumentError
    end

    it 'should return a symbol' do
      expect(direction.points_to_sym(4)).to be_an_instance_of Symbol
    end

    it 'should return :four for 4' do
      expect(direction.points_to_sym(4)).to eql :four
    end

    it 'should return :eight for 8' do
      expect(direction.points_to_sym(8)).to eql :eight
    end

    it 'should return :four for 16' do
      expect(direction.points_to_sym(16)).to eql :sixteen
    end

    it 'should return :four for 32' do
      expect(direction.points_to_sym(32)).to eql :thirtytwo
    end
  end

  context '#validate_points' do
    let(:vp) { direction.validate_points(4) }

    it 'should accept no more than one arg' do
      expect do
        direction.validate_points(nil, nil)
      end.to raise_error ArgumentError
    end

    it 'should accept no less than one arg' do
      expect do
        direction.validate_points
      end.to raise_error ArgumentError
    end

    it 'should return nil' do
      expect(vp).to be_nil
    end

    it 'should raise ArgumentError when passed invalid Fixnum' do
      expect do
        direction.validate_points(370)
      end.to raise_error ArgumentError
    end

    it 'should raise ArgumentError if passed a String' do
      expect do
        direction.validate_points('')
      end.to raise_error ArgumentError
    end

    it 'should raise ArgumentError if passed nil' do
      expect do
        direction.validate_points(nil)
      end.to raise_error ArgumentError
    end

    it 'should raise ArgumentError if passed a symbol' do
      expect do
        direction.validate_points(:x)
      end.to raise_error ArgumentError
    end

    it 'should raise ArgumentError if passed a Float' do
      expect do
        direction.validate_points(0.0)
      end.to raise_error ArgumentError
    end

    it 'should raise ArgumentError if passed a Array' do
      expect do
        direction.validate_points([])
      end.to raise_error ArgumentError
    end

    it 'should raise ArgumentError if passed a Hash' do
      expect do
        direction.validate_points({})
      end.to raise_error ArgumentError
    end
  end

  context '#validate_bearing' do
    let(:vb) { direction.validate_bearing(0) }

    it 'should accept no more than one arg' do
      expect do
        direction.validate_bearing(nil, nil)
      end.to raise_error ArgumentError
    end

    it 'should accept no less than one arg' do
      expect do
        direction.validate_bearing
      end.to raise_error ArgumentError
    end

    it 'should return nil' do
      expect(vb).to be_nil
    end

    it 'should raise ArgumentError when passed invalid Fixnum' do
      expect do
        direction.validate_bearing(370)
      end.to raise_error ArgumentError
    end

    it 'should raise ArgumentError if passed a String' do
      expect do
        direction.validate_bearing('')
      end.to raise_error ArgumentError
    end

    it 'should raise ArgumentError if passed nil' do
      expect do
        direction.validate_bearing(nil)
      end.to raise_error ArgumentError
    end

    it 'should raise ArgumentError if passed a symbol' do
      expect do
        direction.validate_bearing(:x)
      end.to raise_error ArgumentError
    end

    it 'should raise ArgumentError if passed a Array' do
      expect do
        direction.validate_bearing([])
      end.to raise_error ArgumentError
    end

    it 'should raise ArgumentError if passed a Hash' do
      expect do
        direction.validate_bearing({})
      end.to raise_error ArgumentError
    end
  end

  context '#calculate' do
    let(:c) { direction.calculate(0, 32) }

    it 'should accept no more than two args' do
      expect do
        direction.calculate(nil, nil, nil)
      end.to raise_error ArgumentError
    end

    it 'should accept no less than two args' do
      expect do
        direction.calculate(nil)
      end.to raise_error ArgumentError
    end

    it 'should return a Hash' do
      expect(c).to be_an_instance_of Hash
    end

    it 'should have the :full key' do
      expect(c.key?(:full)).to be_truthy
    end

    it 'should have :full String' do
      expect(c[:full]).to be_an_instance_of String
      expect(c[:full].empty?).to be_falsey
    end

    it 'should have the :abbr key' do
      expect(c.key?(:abbr)).to be_truthy
    end

    it 'should have :abbr String' do
      expect(c[:abbr]).to be_an_instance_of String
      expect(c[:abbr].empty?).to be_falsey
    end

    it 'should have the :wind_pt key' do
      expect(c.key?(:wind_pt)).to be_truthy
    end

    it 'should have :wind_pt String' do
      expect(c[:wind_pt]).to be_an_instance_of String
      expect(c[:wind_pt].empty?).to be_falsey
    end
  end
end
