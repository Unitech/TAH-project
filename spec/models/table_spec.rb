require 'spec_helper'

describe Table do
  
  before :each do
    @table = Factory(:table)
  end

  describe "Empty table " do 
    it "step one no accomplished" do
      pending "Waiting for more informations about step one"
      @table.step_one?.should == true
    end
    
    it "step two not accomplished" do
      @table.step_two?.should == false
    end
    
    it "step three not accomplished" do
      @table.step_three?.should == false
    end

    it "has no menus" do 
      @table.menu_count.should == 0
    end
  end

end
