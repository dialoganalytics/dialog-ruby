# encoding: utf-8

$:.unshift File.expand_path('../lib', __FILE__)
require 'dialog-api/version'

Gem::Specification.new do |s|
  s.name          = "dialog-api"
  s.version       = Dialog::VERSION
  s.authors       = ["Philippe Dionne"]
  s.email         = ["p@dialoganalytics.com"]
  s.homepage      = "https://github.com/dialoganalytics/dialog-ruby"
  s.licenses      = ['MIT']
  s.summary       = "A ruby client for the Dialog API."
  s.description   = "Dialog is a conversational analytics platform. See https://dialoganalytics.com for details."

  s.files         = `git ls-files lib`.split("\n")
  s.platform      = Gem::Platform::RUBY
  s.require_paths = ['lib']
  s.test_files    = s.files.grep(%r{^(spec)/})

  s.add_dependency 'http', '~> 2.0'
  s.add_dependency 'activesupport', '>= 3.0'
end
