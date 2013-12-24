# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'smn_ar/version'

Gem::Specification.new do |spec|
  spec.name          = "smn_ar"
  spec.version       = SmnAr::VERSION
  spec.authors       = ["Cristian Rasch"]
  spec.email         = ["cristianrasch@gmail.com"]
  spec.description   = %q{Wrapper para el pronóstico meteorológico publicado por http://www.smn.gov.ar}
  spec.summary       = %q{Esta gema expone el pronóstico meteorológico publicado publicado por el Servicio Meteorológico Nacional argentino (http://www.smn.gov.ar)}
  spec.homepage      = "https://github.com/wecodeio/smn_ar"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "nokogiri"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest", "~> 5.2.0"
end
