# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'virtual_attribute/version'

Gem::Specification.new do |gem|
  gem.name          = "virtual_attribute"
  gem.version       = VirtualAttribute::VERSION
  gem.authors       = ["Juan Ibiapina"]
  gem.email         = ["juanibiapina@gmail.com"]
  gem.description   = %q{Virtual attribute DSL}
  gem.summary       = %q{Virtual attribute DSL}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'guard'
  gem.add_development_dependency 'guard-rspec'
  gem.add_development_dependency 'guard-bundler'
  gem.add_development_dependency 'guard-ctags-bundler'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'rb-fsevent'

  gem.add_dependency 'active_support'
end