require 'spec_helper'

describe User do
  #include Devise::TestHelpers
  
  before(:each) do
    @user = Factory(:user)
  end
  
  it "right values for Status field" do
    User::Status::HOST.should equal 0
    User::Status::GUEST.should equal 1
    User::Status::HOST_N_GUEST.should equal 2
  end

  
end
