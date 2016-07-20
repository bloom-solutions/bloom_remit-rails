$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "bloom_remit/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "bloom_remit"
  s.version     = BloomRemit::VERSION
  s.authors     = ["Ramon Tayag"]
  s.email       = ["ramon.tayag@gmail.com"]
  s.homepage    = "https://github.com/imacchiato/bloom_remit-rails"
  s.summary     = "Rails engine for Bloom Remit users"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.5.1"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
end
