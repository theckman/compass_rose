# -*- coding: UTF-8 -*-

# Stuff
#
module CompassRose
  # RoseUtils module is used to build the RANGES constant below
  #
  module RoseUtils
    def self.build_rose(rose_map)
      last_bearing = 0.00
      h = hashit(rose_map, last_bearing)
      h
    end

    def self.hashit(rose_map, last_bearing)
      h = {}
      rose_map[:d].each do |b|
        if last_bearing == 0
          low, high, last_bearing = bearing_zero(rose_map)
        else
          low, high, last_bearing = bearing_nonzero(rose_map, last_bearing)
        end
        h[b] = { low: low, high: high }
      end
      h
    end

    def self.bearing_zero(rose_map)
      low = format(
        '%.2f', (360.0 - (rose_map[:s] / 2.0)) + 0.01
      ).to_f
      last_bearing = high = format(
        '%.2f', 0.00 + (rose_map[:s] / 2.0)
      ).to_f
      [low, high, last_bearing]
    end

    def self.bearing_nonzero(rose_map, last_bearing)
      low = format('%.2f', last_bearing + 0.01).to_f
      last_bearing = high = format('%.2f', last_bearing + rose_map[:s]).to_f
      [low, high, last_bearing]
    end
  end
  extend RoseUtils

  FOUR ||= {
    s: (360 / 4.0),
    d: [:north, :east, :south, :west]
  }

  EIGHT ||= {
    s: (360 / 8.0),
    d: [
      :north, :northeast, :east, :southeast,
      :south, :southwest, :west, :northwest
    ]
  }

  SIXTEEN ||= {
    s: (360 / 16.0),
    d: [
      :north, :north_northeast, :northeast, :east_northeast, :east,
      :east_southeast, :southeast, :south_southeast, :south,
      :south_southwest, :southwest, :west_southwest, :west, :west_northwest,
      :northwest, :north_northwest
    ]
  }

  THIRTYTWO ||= {
    s: (360 / 32.0),
    d: [
      :north, :north_by_east, :north_northeast, :northeast_by_north,
      :northeast, :northeast_by_east, :east_northeast, :east_by_north, :east,
      :east_by_south, :east_southeast, :southeast_by_east, :southeast,
      :southeast_by_south, :south_southeast, :south_by_east, :south,
      :south_by_west, :south_southwest, :southwest_by_south, :southwest,
      :southwest_by_west, :west_southwest, :west_by_south, :west,
      :west_by_north, :west_northwest, :northwest_by_west, :northwest,
      :northwest_by_north, :north_northwest, :north_by_west
    ]
  }

  RANGES ||= {
    four: RoseUtils.build_rose(FOUR),
    eight: RoseUtils.build_rose(EIGHT),
    sixteen: RoseUtils.build_rose(SIXTEEN),
    thirtytwo: RoseUtils.build_rose(THIRTYTWO)
  }
end
