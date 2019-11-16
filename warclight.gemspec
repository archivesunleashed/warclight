# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'warclight/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name            = 'warclight'
  s.version         = Warclight::VERSION
  s.authors         = ['Nick Ruest']
  s.email           = ['ruestn@yorku.ca']
  s.homepage        = 'https://github.com/archivesunleashed/warclight'
  s.summary         = 'A Rails engine supporting discovery of web archives.'
  s.license         = 'Apache-2.0'

  s.files           = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  s.bindir          = 'exe'
  s.executables     = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths   = ['lib']

  s.add_dependency 'blacklight', '7.4.1'
  s.add_dependency 'blacklight_range_limit', '7.1.0'
  s.add_dependency 'rails', '~> 5'

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'engine_cart', '~> 2.3.0'
  s.add_development_dependency 'mocha'
  s.add_development_dependency 'poltergeist'
  s.add_development_dependency 'rake', '~> 13.0'
  s.add_development_dependency 'rspec-rails', '~> 3.0'
  s.add_development_dependency 'rubocop', '~> 0.75.0'
  s.add_development_dependency 'rubocop-performance'
  s.add_development_dependency 'rubocop-rspec', '~> 1.36.0'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'solr_wrapper'
  s.add_development_dependency 'sqlite3'
end
