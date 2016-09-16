# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'http_signature/version'

Gem::Specification.new do |spec|
  spec.name          = "http_signature"
  spec.version       = HttpSignature::VERSION
  spec.authors       = ["Caius Durling"]
  spec.email         = %w(dev@caius.name)

  spec.summary       = %{HTTP Signature Authentication library}
  spec.description   = %{HTTP Signature Authentication library implementing Joyent's HTTP Signature Authentication Specification}
  spec.homepage      = "https://github.com/caius/http_signature"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
