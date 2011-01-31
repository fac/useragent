# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "user_agent/version"

Gem::Specification.new do |s|
  s.name        = "useragent"
  s.version     = UserAgent::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Joshua Peek"]
  s.email       = ["josh@joshpeek.com"]
  s.homepage    = "https://rubygems.org/gems/useragent"
  s.summary     = %q{HTTP User Agent parser}
  s.description = %q{UserAgent is a Ruby library that parses and compares HTTP User Agents.}

  s.rubyforge_project = "useragent"

  s.files         = Dir.glob('{lib}/**/*') + %w[CHANGELOG.rdoc LICENSE README.rdoc]
  s.test_files    = Dir.glob('{spec}/**/*')
  s.require_paths = ["lib"]
  
  s.add_development_dependency 'rspec', '~> 2.4.0'
end
