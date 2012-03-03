require 'spec_helper'

describe DishDashboardController do
  include Devise::TestHelpers

  before :each do 
    @user = Factory(:user)
    sign_in @user
  end

  describe "test methods" do
  end

end
