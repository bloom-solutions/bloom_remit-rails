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
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.2"
  s.add_dependency "pg"
  s.add_dependency "storext"
  s.add_dependency "bloom_remit_client"
  s.add_dependency "sidekiq"
  s.add_dependency "sidekiq-cron"
  s.add_dependency "trailblazer"
  s.add_dependency "light-service"
  # NOTE: trailblazer-rails uses trailblazer-loader which blows up
  # when it can't find the files in the app's app/concerns folder.
  # require the libraries we need instead of going using trailblazer-loader
  s.add_dependency "disposable"
  s.add_dependency "reform-rails"
  s.add_dependency "roar-rails"
  s.add_dependency "representable"
  s.add_dependency "multi_json"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "storext-matchers"
  s.add_development_dependency "vcr"
  s.add_development_dependency "webmock"
  s.add_development_dependency "dotenv"
  s.add_development_dependency "rspec-sidekiq"
  s.add_development_dependency "shoulda-matchers"
end
