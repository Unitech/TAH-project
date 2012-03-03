require 'spec_helper'

describe Dish do
  describe "test fields" do
    before :each do 
      @user = Factory(:user)
      @table = Factory(:table, :user => @user)
      @menu = Factory(:menu, :table => @table)
      @dish = Factory(:dish, :menu => @menu)
    end

    it "fails when no title" do
      @dish = Dish.create(:description => 'asdasd', :menu => @menu)
      @dish.should_not be_valid
    end
  end
end
