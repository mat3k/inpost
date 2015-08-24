# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'inpost/version'

Gem::Specification.new do |spec|
  spec.name          = "inpost"
  spec.version       = Inpost::VERSION
  spec.authors       = ["Mateusz Baltyn"]
  spec.email         = ["mateusz.baltyn@gmail.com"]
  spec.summary       = %q{Inpost machine api client.}
  spec.description   = %q{}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry", '~> 0.10.1'

  spec.add_dependency "rest-client", '~> 1.8.0'
end
