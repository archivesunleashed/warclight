$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "warclight/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "warclight"
  s.version     = Warclight::VERSION
  s.authors     = ["Nick Ruest"]
  s.email       = ["ruestn@yorku.ca"]
  s.homepage    = "https://github.com/archivesunleashed/warclight"
  s.summary     = "A Rails engine supporting discovery of web archives."
  s.license     = "Apache-2.0"

  s.files = Dir["{app,config,db,lib}/**/*", "LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.2"

  s.add_development_dependency "sqlite3"
end
