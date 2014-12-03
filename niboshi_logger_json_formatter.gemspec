# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'niboshi_logger_json_formatter/version'

Gem::Specification.new do |spec|
  spec.name          = "niboshi_logger_json_formatter"
  spec.version       = Niboshi::Logger::JsonFormatter::VERSION
  spec.authors       = ["azukiwasher"]
  spec.email         = ["azukiwasher@higanworks.com"]
  spec.summary       = %q{Make your Rails app log in JSON Format.}
  spec.description   = %q{Make your Rails app log in JSON Format.}
  spec.homepage      = "https://github.com/ZCloud-Firstserver/niboshi_logger_json_formatter"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
