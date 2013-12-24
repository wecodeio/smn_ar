require_relative "../scripts/scraper"

module SmnAr
  class Ciudad
    attr_reader :provincia_id, :nombre_provincia, :nombre

    def initialize(provincia_id, nombre_provincia, nombre)
      @provincia_id = provincia_id.to_i
      @nombre_provincia, @nombre = nombre_provincia, nombre
    end

    def self.todas
      @todas ||= Scraper.new.ciudades
    end
  end
end
