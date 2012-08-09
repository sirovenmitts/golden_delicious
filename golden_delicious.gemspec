# -*- encoding: utf-8 -*-
require File.expand_path('../lib/golden_delicious/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Kenneth Pullen"]
  gem.email         = ["kenneth.pullen@gmail.com"]
  gem.description   = <<-DESC
  This gem will check the validity of an Apple serial number, and will pull some
  extra information from everymac.com.
  DESC
  gem.summary       = %q{Get some sweet info about your Apple}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "golden_delicious"
  gem.require_paths = ["lib"]
  gem.version       = GoldenDelicious::VERSION

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'simplecov-gem-adapter'
  
  gem.add_dependency 'httparty'
  gem.add_dependency 'json'
  gem.add_dependency 'nokogiri'
  gem.add_dependency 'memoist'
end
