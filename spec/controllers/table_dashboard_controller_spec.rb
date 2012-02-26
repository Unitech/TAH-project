require 'spec_helper'

describe TableDashboardController do
  include Devise::TestHelpers
  
  # before(:each) do 
  #   @user = Factory(:user)
  #   sign_in @user
  # end

  it "acces to dashboard" do
    get :index
    response.should_not be_success 
    response.should be_redirect
  end

  it "redirect me" do
    get :index
    response.should be_redirect
  end

  it "shoudl contain the right text" do 
    get :index
    response.should include_text(I18n.t('devise.failure.unauthenticated'))
  end

  
  
end
