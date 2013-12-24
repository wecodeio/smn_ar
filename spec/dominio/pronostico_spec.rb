require_relative "../spec_helper"
require File.expand_path("lib/smn_ar/dominio/pronostico")
require File.expand_path("lib/smn_ar/dominio/ciudad")

describe SmnAr::Pronostico do
  let(:ciudad) { SmnAr::Ciudad.new(4, "Buenos Aires", "9 de Julio") }
  subject { SmnAr::Pronostico.new(ciudad) }

  it "scrapea la temperatura actual" do
    subject.temperatura_actual.must_be :>, 0
  end

  it "scrapea el pronostico meteorológico para hoy" do
    pronostico_para_hoy = subject[Date.today]

    pronostico_para_hoy.wont_be_nil
    pronostico_para_hoy.minima.must_be :>, 0
    pronostico_para_hoy.maxima.must_be :>, 0
  end

  it "scrapea el pronostico meteorológico para mañana" do
    pronostico_para_maniana = subject[Date.today + 1]

    pronostico_para_maniana.wont_be_nil
    pronostico_para_maniana.minima.must_be :>, 0
    pronostico_para_maniana.maxima.must_be :>, 0
  end
end
