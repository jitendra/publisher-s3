# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'publisher/s3/version'

Gem::Specification.new do |spec|
  spec.name          = "publisher-s3"
  spec.version       = Publisher::S3::VERSION
  spec.authors       = ["Jiten"]
  spec.email         = ["jitendra.vinsol@gmail.com"]
  spec.description   = %q{Publisher S3 upload/download}
  spec.summary       = %q{Publisher S3 upload/download}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "aws-s3"
end
