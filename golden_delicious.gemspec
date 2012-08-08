# -*- encoding: utf-8 -*-
require File.expand_path('../lib/golden_delicious/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Kenneth Pullen"]
  gem.email         = ["kenneth.pullen@gmail.com"]
  gem.description   = %q{Check the validity of an Apple serial number}
  gem.summary       = %q{Check the validity of an Apple serial number}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "golden_delicious"
  gem.require_paths = ["lib"]
  gem.version       = GoldenDelicious::VERSION

  gem.add_development_dependency 'rspec'
  gem.add_dependency 'httparty'
  gem.add_dependency 'crack'
end
