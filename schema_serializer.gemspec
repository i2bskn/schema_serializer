
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "schema_serializer/version"

Gem::Specification.new do |spec|
  spec.name          = "schema_serializer"
  spec.version       = SchemaSerializer::VERSION
  spec.authors       = ["i2bskn"]
  spec.email         = ["i2bskn@gmail.com"]

  spec.summary       = %q{SchemaSerializer is provide serialization from schema definition to JSON.}
  spec.description   = %q{SchemaSerializer is provide serialization from schema definition to JSON.}
  spec.homepage      = "https://github.com/i2bskn/schema_serializer"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "openapi3_parser"
end
