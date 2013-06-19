require_relative '../../../lib/server'
require_relative '../../../lib/computer'
require_relative '../../../lib/sandbox'
require_relative '../../../lib/mail_sender'

class Organizer

  # Set up this object with names that can be used to look up objects needed to run this test
  # @param [String] source_id the unique name for the source object
  # @param [String] destination_id the unique name for the destination object
  def initialize()

  end

  def server(ipn=nil)
    Server.new(ipn)
  end

  def sandbox
    Sandbox.new
  end

  def destination
    Computer.new
  end

  def email
    MailSender.new
  end

end
