require 'spec_helper'

describe User do
  let(:user) { Factory(:user) }
  
  before(:each) do
    @user = Factory(:user)
  end
  
  it "should select ur mum" do
    a = User.five_last
    a.count.should equal 1
  end

  it "this is a test" do
    pending "ayaya"
  end
end
