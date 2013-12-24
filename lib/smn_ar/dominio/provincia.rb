require_relative "../scripts/scraper"

module SmnAr
  class Provincia
    attr_reader :id, :nombre

    def initialize(id, nombre)
      @id, @nombre = id, nombre
    end

    def self.todas
      @todas ||= Scraper.new.provincias
    end
  end
end
