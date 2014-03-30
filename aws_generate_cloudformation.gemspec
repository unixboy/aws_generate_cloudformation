# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'aws_generate_cloudformation/version'

Gem::Specification.new do |spec|
  spec.name          = "aws_generate_cloudformation"
  spec.version       = AwsGenerateCloudformation::VERSION
  spec.authors       = ["Ben House"]
  spec.email         = ["ben@benhouse.io"]
  spec.summary       = %q{generates and instantiates cloudformation templates}
  spec.description   = spec.summary
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "aws-sdk-core", "~> 2.0.0.rc2"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "cane"
  spec.add_development_dependency "tailor"
  spec.add_development_dependency "countloc"
  spec.add_development_dependency "growl"
end
