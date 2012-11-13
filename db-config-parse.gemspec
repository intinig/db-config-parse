# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'db-config-parse/version'

Gem::Specification.new do |gem|
  gem.name          = "db-config-parse"
  gem.version       = DBConfig::VERSION
  gem.authors       = ["Giovanni Intini"]
  gem.email         = ["giovanni@mikamai.com"]
  gem.description   = %q{Parses db configuration data from popular php packages}
  gem.summary       = %q{Parses db configuration data from popular php packages}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
