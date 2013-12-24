require "open-uri"
require "uri"

require_relative "../dominio/provincia"
require_relative "../dominio/ciudad"

module SmnAr
  class Scraper
    URL = "http://www.smn.gov.ar/?mod=pron&id=2".freeze
    REGEXP = /\?mod=pron&id=(\d+)&provincia=([^&]+)&ciudad=([^"]+)/

    def ciudades
      @ciudades ||= matches.map { |arr| Ciudad.new(*arr) }
    end

    def provincias
      @provincias ||= begin
        arr = ciudades.map { |ciudad| [ciudad.provincia_id, ciudad.nombre_provincia] }.uniq!
        arr.map! { |a| Provincia.new(*a) }
      end
    end

  private

    def matches
      @matches ||= begin
        html = open(URL).read
        html.scan(REGEXP)
      end
    end
  end
end
