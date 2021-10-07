# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name = 'rails-utils'
  s.version     = '1.0.0'
  s.summary     = 'Basic Rails Utils for Talenthack'
  s.description = 'Basic Rails Utils for Talenthack'
  s.author      = 'hello@thetalenthack.com'
  s.files       = `git ls-files -- {lib,spec}/*`.split("\n")
  s.homepage    = 'https://github.com/thetalenthack/rails-utils'
  s.email       = 'hello@thetalenthack.com'
  s.license     = 'MIT'

  s.add_dependency 'activesupport', '~> 6.1'
  s.add_dependency 'interactor', '~> 3.0'
  s.add_dependency 'faraday'
  s.add_development_dependency 'rspec', '~> 3.8'

  s.test_files = Dir['spec/**/*']
end