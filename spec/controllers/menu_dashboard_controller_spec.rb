require 'spec_helper'

describe MenuDashboardController do
  include Devise::TestHelpers

  before :each do 
    @user = Factory(:user)
    sign_in @user
  end

  describe "test views" do
    it "succeed index" do
      get :index
    end

    it "succeed edit" do
      get :edit
    end

  end
end
