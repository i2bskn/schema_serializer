lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "schema_serializer/version"

Gem::Specification.new do |spec|
  spec.name          = "schema_serializer"
  spec.version       = SchemaSerializer::VERSION
  spec.authors       = ["i2bskn"]
  spec.email         = ["i2bskn@gmail.com"]

  spec.summary       = "SchemaSerializer is provide serialization from schema definition to JSON."
  spec.description   = "SchemaSerializer is provide serialization from schema definition to JSON."
  spec.homepage      = "https://github.com/i2bskn/schema_serializer"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.6"

  spec.add_dependency "activesupport", ">= 5.2.0", "< 6.2"
  spec.add_dependency "yaml_ext", "0.1.2"

  spec.add_development_dependency "activerecord", ">= 5.2.0", "< 6.2"
  spec.add_development_dependency "bundler", ">= 2.1.0"
  spec.add_development_dependency "pry", "~> 0.14.0"
  spec.add_development_dependency "rake", "~> 13.0.0"
  spec.add_development_dependency "rspec", "~> 3.10.0"
  spec.add_development_dependency "rubocop", "~> 1.11.0"
  spec.add_development_dependency "sqlite3", "~> 1.4.2"
end
