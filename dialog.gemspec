# encoding: utf-8

$:.unshift File.expand_path('../lib', __FILE__)
require 'dialog/version'

Gem::Specification.new do |s|
  s.name          = "dialog"
  s.version       = Dialog::VERSION
  s.authors       = ["Philippe Dionne"]
  s.email         = ["dionne.phil@gmail.com"]
  s.homepage      = "https://github.com/dialog/dialog-ruby"
  s.licenses      = ['MIT']
  s.summary       = "Dialog - conversational analytics"
  s.description   = "Dialog - conversational analytics"

  # s.cert_chain  = ['certs/pdionne-gem-public_cert.pem']
  # s.signing_key = File.expand_path("~/.gem/pdionne-gem-private_key.pem") if $0 =~ /gem\z/

  s.files         = `git ls-files lib`.split("\n")
  s.platform      = Gem::Platform::RUBY
  s.require_paths = ['lib']
  s.test_files    = s.files.grep(%r{^(spec)/})

  s.add_dependency 'faraday', '~> 0.8'
  s.add_dependency 'faraday_middleware'
end
