# SmnAr

Esta gema expone el pronóstico meteorológico publicado publicado por el [Servicio Meteorológico Nacional](http://example.com/ "SMN") argentino

## Installation

Add this line to your application's Gemfile:

    gem 'smn_ar'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install smn_ar

## Usage

```ruby
require "smn_ar"
require "date"

pronostico = SmnAr::Pronostico.new(ciudad)
pronostico.temperatura_actual # => 32.4
temp = pronostico[Date.today] # pronóstico para hoy y los próximos tres días
temp.mimima # => 25
temp.maxima # => 37
pronostico[Date.today+4] # => nil

SmnAr::Ciudad.todas # => todas las ciudades del país soportadas

SmnAr::Provincia.todas # => todas las provincias del país soportadas
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
