# -*- coding: UTF-8 -*-

require 'compass_rose/rose'
require 'compass_rose/ranges'

module CompassRose
  # Direction calculation class
  #
  class Direction
    def self.calculate(bearing, points)
      validate_bearing(bearing)
      validate_points(points)
      p = points_to_sym(points)
      n = find_direction(bearing, CompassRose::RANGES[p])
      CompassRose::ROSE[n]
    end

    def self.validate_bearing(bearing)
      if ![Fixnum, Float].include?(bearing.class) ||
         (bearing >= 360 || bearing < 0)
        fail(ArgumentError, 'arg 1 must be a number between 0.00 and 359.99')
      end
    end

    def self.validate_points(points)
      if points.class != Fixnum ||
         ![4, 8, 16, 32].include?(points)
        fail(ArgumentError, 'arg 2 must be one of: 4, 8, 16, 32')
      end
    end

    def self.points_to_sym(points)
      m = { 4 => :four, 8 => :eight, 16 => :sixteen, 32 => :thirtytwo }
      m[points]
    end

    def self.find_direction(bearing, ranges)
      ranges.each do |k, v|
        if v[:low] > v[:high]
          return k if check_north(bearing, v)
        else
          return k if check_else(bearing, v)
        end
      end
      nil
    end

    def self.check_north(bearing, ranges)
      if bearing >= ranges[:low] || bearing <= ranges[:high]
        true
      else
        false
      end
    end

    def self.check_else(bearing, ranges)
      if bearing >= ranges[:low] && bearing <= ranges[:high]
        true
      else
        false
      end
    end
  end
end
