# -*- coding: UTF-8 -*-

# Compass Rose
#
# Contains the ::ROSE constant which contains all points
#
module CompassRose
  # obtained rose data from
  # - https://en.wikipedia.org/wiki/Points_of_the_compass
  #
  ROSE ||= {
    # when only broken in to 4 parts
    north: { full: 'North', abbr: 'N', wind_pt: 'Tramontana' },
    east: { full: 'East', abbr: 'E', wind_pt: 'Levante' },
    south: { full: 'South', abbr: 'S', wind_pt: 'Ostro' },
    west: { full: 'West', abbr: 'W', wind_pt:  'Ponente' },

    # when broken in to 8 parts
    northeast: { full: 'Northeast', abbr: 'NE', wind_pt: 'Greco' },
    southeast: { full: 'Southeast', abbr: 'SE', wind_pt: 'Scirocco' },
    southwest: { full: 'Southwest', abbr: 'SW', wind_pt: 'Libeccio' },
    northwest: { full: 'Northwest', abbr: 'NW', wind_pt: 'Maestro' },

    # when broken in to 16 parts
    north_northeast: {
      full: 'North-northeast', abbr: 'NNE', wind_pt: 'Greco-Tramontana'
    },
    east_northeast: {
      full: 'East-northeast', abbr: 'ENE', wind_pt: 'Greco-Levante'
    },
    east_southeast: {
      full: 'East-southeast', abbr: 'ESE', wind_pt: 'Levante-Scirocco'
    }, # Listen up ese...
    south_southeast: {
      full: 'South-southeast', abbr: 'SSE', wind_pt: 'Ostro-Scirocco'
    },
    south_southwest: {
      full: 'South-southwest', abbr: 'SSW', wind_pt: 'Ostro-Libeccio'
    },
    west_southwest: {
      full: 'West-southwest', abbr: 'WSW', wind_pt: 'Ponente-Libeccio'
    },
    west_northwest: {
      full: 'West-northwest', abbr: 'WNW', wind_pt: 'Maestro-Ponente'
    },
    north_northwest: {
      full: 'North-northwest', abbr: 'NNW', wind_pt: 'Maestro-Tramontana'
    },

    # when broken in to 32 parts
    north_by_east: {
      full: 'North by east', abbr: 'NbE',
      wind_pt: 'Qto Tramontana verso Greco'
    },
    northeast_by_north: {
      full: 'Northeast by north', abbr: 'NEbN',
      wind_pt: 'Qto Greco verso Tramontana'
    },
    northeast_by_east: {
      full: 'Northeast by east', abbr: 'NEbE',
      wind_pt: 'Qto Greco verso Levante'
    },
    east_by_north: {
      full: 'East by north', abbr: 'EbN',
      wind_pt: 'Qto Levante verso Greco'
    },
    east_by_south: {
      full: 'East by south', abbr: 'EbS',
      wind_pt: 'Qto Levante verso Scirocco'
    },
    southeast_by_east: {
      full: 'Southeast by east', abbr: 'SEbE',
      wind_pt: 'Qto Scirocco verso Levante'
    },
    southeast_by_south: {
      full: 'Southeast by south', abbr: 'SEbS',
      wind_pt: 'Qto Scirocco verso Ostro'
    },
    south_by_east: {
      full: 'South by east', abbr: 'SbE',
      wind_pt: 'Qto Ostro verso Scirocco'
    },
    south_by_west: {
      full: 'South by west', abbr: 'SbW',
      wind_pt: 'Qto Ostro verso Libeccio'
    },
    southwest_by_south: {
      full: 'Southwest by south', abbr: 'SWbS',
      wind_pt: 'Qto Libeccio verso Ostro'
    },
    southwest_by_west: {
      full: 'Southwest by west', abbr: 'SWbW',
      wind_pt: 'Qto Libeccio verso Ponente'
    },
    west_by_south: {
      full: 'West by south', abbr: 'WbS',
      wind_pt: 'Qto Ponente verso Libeccio'
    },
    west_by_north: {
      full: 'West by north', abbr: 'WbN',
      wind_pt: 'Qto Ponente verso Maestro'
    },
    northwest_by_west: {
      full: 'Northwest by west', abbr: 'NWbW',
      wind_pt: 'Qto Maestro verso Ponente'
    },
    northwest_by_north: {
      full: 'Northwest by north', abbr: 'NWbN',
      wind_pt: 'Qto Maestro verso Tramontana'
    },
    north_by_west: {
      full: 'North by west', abbr: 'NbW',
      wind_pt: 'Qto Tramontana verso Maestro'
    }
  }
end
