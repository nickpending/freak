# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'freak/version'

Gem::Specification.new do |spec|
  spec.name          = "freak"
  spec.version       = Freak::VERSION
  spec.authors       = ["Rudy Ruiz"]
  spec.email         = ["roodee@thummy.com"]
  spec.summary       = %q{A frequency analysis toolkit for English.}
  spec.description   = %q{Freak is a frequency analysis toolkit for English.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
