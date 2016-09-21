# encoding: utf-8

$:.unshift File.expand_path('../lib', __FILE__)
require 'dialog/version'

Gem::Specification.new do |s|
  s.name          = "dialog-ruby"
  s.version       = Dialog::VERSION
  s.authors       = ["Philippe Dionne"]
  s.email         = ["p@dialoganalytics.com"]
  s.homepage      = "https://github.com/phildionne/dialog-ruby"
  s.licenses      = ['MIT']
  s.summary       = "Dialog - Conversational analytics"
  s.description   = "Dialog - Conversational analytics"

  s.files         = `git ls-files lib`.split("\n")
  s.platform      = Gem::Platform::RUBY
  s.require_paths = ['lib']
  s.test_files    = s.files.grep(%r{^(spec)/})

  s.add_dependency 'http'
end
