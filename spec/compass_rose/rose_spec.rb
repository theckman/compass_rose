# -*- coding: UTF-8 -*-
require 'spec_helper'

TRUSTED_KEYS ||= [
  :north, :east, :south, :west, :northeast, :southeast, :southwest, :northwest,
  :north_northeast, :east_northeast, :east_southeast, :south_southeast,
  :south_southwest, :west_southwest, :west_northwest, :north_northwest,
  :north_by_east, :northeast_by_north, :northeast_by_east, :east_by_north,
  :east_by_south, :southeast_by_east, :southeast_by_south, :south_by_east,
  :south_by_west, :southwest_by_south, :southwest_by_west, :west_by_south,
  :west_by_north, :northwest_by_west, :northwest_by_north, :north_by_west
]

describe CompassRose::ROSE do
  subject { CompassRose::ROSE }

  it { should be_an_instance_of Hash }

  TRUSTED_KEYS.each do |k|
    it "should contain the #{k} key" do
      expect(subject.key?(k)).to be_true
    end

    it "should contain the #{k} Hash" do
      expect(subject[k]).to be_an_instance_of Hash
    end

    it "should contain the #{k} Hash and it should have the :full key" do
      expect(subject[k].key?(:full)).to be_true
    end

    it "should contain the #{k} Hash and it should have the :abbr key" do
      expect(subject[k].key?(:abbr)).to be_true
    end

    it "should contain the #{k} Hash and it should have the :wind_pt key" do
      expect(subject[k].key?(:wind_pt)).to be_true
    end
  end
end
