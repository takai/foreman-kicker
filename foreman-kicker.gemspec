# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'foreman/kicker/version'

Gem::Specification.new do |gem|
  gem.name          = "foreman-kicker"
  gem.version       = Foreman::Kicker::VERSION
  gem.authors       = ["Naoto Takai"]
  gem.email         = %w(takai@cookpad.com)
  gem.description   = ""
  gem.summary       = ""
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
