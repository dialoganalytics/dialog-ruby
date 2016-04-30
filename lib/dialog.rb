require 'dialog/configuration'
require 'dialog/client'

module Dialog
  extend Configuration

  # Alias for Dialog::Client.new
  #
  # @return [Dialog::Client]
  def new(options = {})
    Dialog::Client.new(options)
  end
  module_function :new
end
