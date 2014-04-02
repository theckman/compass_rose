compass_rose
=================
[![Build Status](https://img.shields.io/travis/theckman/compass_rose/master.svg)](https://travis-ci.org/theckman/compass_rose)
[![MIT License](https://img.shields.io/badge/license-MIT-brightgreen.svg)](https://tldrlegal.com/license/mit-license)
[![RubyGems :: RMuh Gem Version](http://img.shields.io/gem/v/compass_rose.svg)](https://rubygems.org/gems/compass_rose)
[![Coveralls Coverage](https://img.shields.io/coveralls/theckman/compass_rose/master.svg)](https://coveralls.io/r/theckman/compass_rose)
[![Code Climate](https://img.shields.io/codeclimate/github/theckman/compass_rose.svg)](https://codeclimate.com/github/theckman/compass_rose)
[![Gemnasium](https://img.shields.io/gemnasium/theckman/compass_rose.svg)](https://gemnasium.com/theckman/compass_rose)

A tiny gem to convert numerical bearings to their string forms.

LICENSE
-------
`compass_rose` is released under
[The MIT License](http://opensource.org/licenses/MIT) The full text of the
license can be found in the `LICENSE` file. The summary can be found
[here](https://tldrlegal.com/license/mit-license#summary) courtest of
tldrlegal.

In short, MIT is a permissive license and means you can pretty much do what you
want with this code as long as the original copyright is included.

CONTRIBUTING
------------
See [CONTRIBUTION.md](https://github.com/theckman/compass_rose/blob/master/CONTRIBUTING.md)
for information on contributing back to this project.

INSTALLATION
------------

```shell
gem install compass_rose
```

Gemfile

```Ruby
gem 'compass_rose'
```

USAGE
-----

```Ruby
require 'compass_rose'
bearing = 232   # directional bearing
points = 16     # the number of points the compass rose should be divided into
d = Compass::Rose.direction(bearing, points)
```

At this point, d would contain the direction. This would be a Hash with the
following keys:

* `full` - full name of the direction, (i.e. `North by east`,
`North-northeast`, etc.)
* `abbr` - direction's abbrivation (i.e., `N`, `ESE`, `SWbW`, etc.)
* `wind_pt` - the traditional wind point (i.e., `Qto Ponente verso Maestro`)

Points
------
A compass rose can be cut in to 4 different sizes: 4, 8, 16, 32. This table
shows which directions are available in the different sizes:

|     Direction      | 4 | 8 | 16 | 32 |
|:------------------:|:-:|:-:|:--:|:--:|
| North              | X | X |  X |  X |
| North by east      |   |   |    |  X |
| North-northeast    |   |   |  X |  X |
| Northeast by north |   |   |    |  X |
| Northeast          |   | X |  X |  X |
| Northeast by east  |   |   |    |  X |
| East-northeast     |   |   |  X |  X |
| East by north      |   |   |    |  X |
| East               | X | X |  X |  X |
| East by south      |   |   |    |  X |
| East-southeast     |   |   |  X |  X |
| Southeast by east  |   |   |    |  X |
| Southeast          |   | X |  X |  X |
| Southeast by south |   |   |    |  X |
| South-southeast    |   |   |  X |  X |
| South by east      |   |   |    |  X |
| South              | X | X |  X |  X |
| South by west      |   |   |    |  X |
| South-southwest    |   |   |  X |  X |
| Southwest by south |   |   |    |  X |
| Southwest          |   | X |  X |  X |
| Southwest by west  |   |   |    |  X |
| West-southwest     |   |   |  X |  X |
| West by south      |   |   |    |  X |
| West               | X | X |  X |  X |
| West by north      |   |   |    |  X |
| West-northwest     |   |   |  X |  X |
| Northwest by west  |   |   |    |  X |
| Northwest          |   | X |  X |  X |
| Northwest by north |   |   |    |  X |
| North-northwest    |   |   |  X |  X |
| North by west      |   |   |    |  X |
