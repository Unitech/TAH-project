require 'spec_helper'

describe AvailabilityController do
  include Devise::TestHelpers
  
  before(:each) do 
    @user = Factory(:user)
    sign_in @user
  end

  it "acces to dashboard" do
    visit table_dashboard_index_path
  end

end
