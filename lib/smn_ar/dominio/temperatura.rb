module SmnAr
  class Temperatura
    attr_reader :minima, :maxima

    def initialize(minima, maxima)
      @minima, @maxima = minima, maxima
    end
  end
end
