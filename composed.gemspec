# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'composed/version'

Gem::Specification.new do |spec|
  spec.name          = "composed-codetest"
  spec.version       = Composed::VERSION
  spec.authors       = ["Alice Wyan"]
  spec.email         = ["alice@finitud.org"]
  spec.summary       = %q{Code test for Composed}
  spec.description   = %q{Code test for Composed}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.metadata['allowed_push_host'] = ''

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.3"
end
