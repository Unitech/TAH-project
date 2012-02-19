require 'spec_helper'

describe User do
  #include Devise::TestHelpers
  
  before(:each) do
    @user = Factory(:user)
  end
  
  it "right values for Type field" do
    User::Type::HOST.should equal 0
    User::Type::GUEST.should equal 1
    User::Type::HOST_N_GUEST.should equal 2
  end

  
end
