require "nokogiri"
require "open-uri"
require "uri"
require "date"

require_relative "temperatura"

module SmnAr
  class Pronostico
    URL = "http://www.smn.gov.ar/?mod=pron&id=:provincia_id&provincia=:nombre_provincia&ciudad=:nombre_ciudad".freeze
    SELECTOR_TEMPERATURA_ACTUAL = "#divPronostico b".freeze
    SELECTOR_TEMPERATURAS = "em:contains(':tipo')".freeze
    REGEXP_TEMPERATURA = /\A(\d+) /
    TEMP_MIN = "Mín".freeze
    TEMP_MAX = "Máx".freeze

    def initialize(ciudad)
      @ciudad = ciudad
    end

    def temperatura_actual
      @temperatura_actual ||= html.at_css(SELECTOR_TEMPERATURA_ACTUAL).text.to_f
    end

    def [](fecha)
      pronosticos[fecha]
    end

  private

    def pronosticos
      @pronosticos ||= begin
        minimas = scrapear_temperaturas(TEMP_MIN)
        maximas = scrapear_temperaturas(TEMP_MAX)
        pronosticos, hoy = {}, Date.today
        minimas.each_with_index do |minima, i|
          pronosticos[hoy + i] = Temperatura.new(minima, maximas[i])
        end
        pronosticos
      end
    end

    def scrapear_temperaturas(tipo_temperatura)
      nodos = html.css(SELECTOR_TEMPERATURAS.gsub(":tipo", tipo_temperatura))
      temps = nodos.map { |nodo| nodo.parent.next.next.text[REGEXP_TEMPERATURA, 1] }
      temps.compact!.map!(&:to_i)
    end

    def html
      @html ||= begin
        url = URL.gsub(":provincia_id", @ciudad.provincia_id.to_s).
                    gsub(":nombre_provincia", nombre_provincia).
                    gsub(":nombre_ciudad", nombre_ciudad)
        Nokogiri::HTML(open(url))
      end
    end

    def nombre_provincia
      URI.encode(@ciudad.nombre_provincia)
    end

    def nombre_ciudad
      URI.encode(@ciudad.nombre)
    end
  end
end
