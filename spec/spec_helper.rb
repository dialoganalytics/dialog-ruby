require 'bundler/setup'
require 'rspec'

require 'dialog'

RSpec.configure do |config|
  config.filter_run focus: true
  config.filter_run_excluding skip: true
  config.run_all_when_everything_filtered = true
end
