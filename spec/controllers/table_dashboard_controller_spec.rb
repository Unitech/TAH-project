require 'spec_helper'

describe TableDashboardController do
  include Devise::TestHelpers
    
  describe "not logged user" do
    it "fail to access to dashboard" do
      get :index
      response.should_not be_success 
      response.should be_redirect
    end
    
    it "and it redirects him" do
      get :index
      response.should be_redirect
    end
    
  end

  describe "user logged" do
    before(:each) do 
      @user = Factory(:user)
      sign_in @user
      get :index
    end

    it "succed to acces to the dashboard" do
      response.should be_success
    end

    it "not redirected" do
      response.should_not be_redirect
    end

    it "create a new table" do
      request.env["HTTP_REFERER"] = '/'
      get :create_new
      @user.tables.count.should == 1
      get :create_new
      @user.tables.count.should == 2      
    end

    it "edit table title" do
      request.env["HTTP_REFERER"] = '/'
      get :create_new
      @user.tables.count.should == 1
      @table = @user.tables.first
      post :update_table, {:table_id => @table.id, :table => {:title => 'new'}}
      @user.tables.first.title.should == 'new'
    end
    
    it "get all tables without creating" do
      get :index
      assigns(:tables).count.should == 0
    end

    it "get one table after creating" do
      request.env["HTTP_REFERER"] = '/'
      get :create_new
      get :index
      assigns(:tables).count.should == 1
    end
  end

  
  

  
  
end
