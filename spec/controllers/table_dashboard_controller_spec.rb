require 'spec_helper'

describe TableDashboardController do
  include Devise::TestHelpers

  describe "test views" do
    it "succeed accessing index" do
      get :index
    end

    it "succeed accessing manage" do
      get :manage
    end

    it "succeed accessing edit availabilities" do
      get :edit_availabilities
    end

    
  end
    
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

    it "flash message" do
      get :index
      flash[:alert].should == 'You need to sign in or sign up before continuing.'
    end
  end

  describe "user logged" do
    before(:each) do 
      @user = Factory(:user)
      sign_in @user
      get :index
      request.env["HTTP_REFERER"] = '/'
    end

    it "succed to acces to the dashboard" do
      response.should be_success
    end

    it "not redirected" do
      response.should_not be_redirect
    end

    it "create a new table" do
      post :create_new
      @user.tables.count.should == 1
      post :create_new
      @user.tables.count.should == 2      
    end

    it "edit table title" do
      post :create_new
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
      post :create_new
      get :index
      assigns(:tables).count.should == 1
    end

    it "render a special table" do
      post :create_new, {:table => {:title => 'test', :description => 'ayay'}}
      @table = Table.last
      @table.title.should == 'test'
      @table.description.should == 'ayay'
    end

  end  
  
end
