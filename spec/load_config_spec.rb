require 'rspec'
require_relative '../lib/load_config'

describe LoadConfig do

  TEST_MODE_ON = true

  before(:each) do
    LoadConfig.set_test_mode(TEST_MODE_ON)
    @config = LoadConfig.new
  end

  it 'retrieves the server URL' do
    @config.server_url.should == 'http://localhost:8810/'
  end


  it 'retrieves the developer computer URL for the router to send IPNs to' do
    @config.final_destination_url.should == 'http://localhost:3000/payments/ipn'
  end

  it 'retrieves the number of seconds between polls' do
    @config.polling_interval_seconds.should == '5.0'
  end

  it 'retrieves the email info which is constant' do
    @config.mail_creator.should == {}
  end

  it 'retrieves the sandbox ids' do
    @config.sandbox_ids.should == ['my_sandbox_id', 'my_sandbox_id_1']
  end

  it 'retrieves the computer_testing booleans for the server hash' do
    @config.computer_testing.should == {'my_sandbox_id'=>false, 'my_sandbox_id_1'=>false}
  end

  it 'retrieves the queue map for the server' do
    @config.queue_map.should ==  {'my_sandbox_id'=>nil, 'my_sandbox_id_1'=>nil}
  end

  it 'retrieves a hash of the time that the last poll of an online computer occurred' do
    @config.last_poll_time.should == {'my_sandbox_id'=>nil, 'my_sandbox_id_1'=>nil}
  end

  it 'retrieves the map of ids to developer emails for sending email notificaitons' do
    @config.email_map.should == {'my_sandbox_id'=>'developer@gmail.com', 'my_sandbox_id_1'=>'bob@example.com'}
  end

  it 'retrieves a hash of when the last unexpected poll occured' do
    @config.poll_checker_instance.should == {'my_sandbox_id'=>nil, 'my_sandbox_id_1'=>nil}
  end

  it 'retrieves a hash of ipn_reception_checker instances' do
    @config.ipn_reception_checker_instance.should == {'my_sandbox_id'=>nil, 'my_sandbox_id_1'=>nil}
  end

  it 'should retrieve the interval for poll checking in seconds' do
    @config.poll_checking_interval_seconds.should == '.1'
  end

  it 'should retrieve the time that passes before an email is send to a developer stating that no IPNs are being received on the server' do
   @config.no_ipn_time_before_notification.should == 1
  end
end
