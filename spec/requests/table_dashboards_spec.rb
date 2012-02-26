require 'spec_helper'

describe "TableDashboards" do
  #include Devise::TestHelpers

  describe "GET /table_dashboards" do
    before(:each) do
      # @user = Factory(:user)
      # sign_in @user
    end

    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get table_dashboard_index_path
      response.status.should be(302)
    end
  end
end
