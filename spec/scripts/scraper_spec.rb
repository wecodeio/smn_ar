require_relative "../spec_helper"
require File.expand_path("lib/smn_ar/scripts/scraper")

describe SmnAr::Scraper do
  subject { SmnAr::Scraper.new }

  it "scrapea las provincias" do
    subject.provincias.length.must_equal 24
  end

  it "scrapea las ciudades" do
    subject.ciudades.wont_be_empty
  end
end
