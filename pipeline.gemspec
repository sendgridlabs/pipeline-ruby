# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pipeline-ruby/version'

Gem::Specification.new do |spec|
  spec.name          = "pipeline"
  spec.version       = PipelineRuby::VERSION
  spec.authors       = ["paladiy"]
  spec.email         = ["olexanderpaladiy@gmail.com"]
  spec.summary       = %q{Ruby gem for pipeline api}
  spec.description   = %q{Ruby gem for pipeline api}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rspec",     ">= 2.14"
  spec.add_development_dependency "rspec-its", "~> 1.0.1"
  spec.add_development_dependency "simplecov", "~> 0.7.1"
  spec.add_development_dependency "vcr", '~> 2.9.2'
  spec.add_development_dependency "webmock", "~> 1.14.0"
  spec.add_development_dependency "rake"

  spec.add_runtime_dependency "httparty"
end
