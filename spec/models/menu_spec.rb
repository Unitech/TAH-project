require 'spec_helper'
require 'test_helper'

describe Menu do
  describe "test fields" do
    it "succeed creating" do
      transcendant_factory
      @menu.should be_valid
    end
    
    it "fails when category is plus" do
      lambda {
        @menu = Factory(:menu, :category => 50)
      }.should raise_error(ActiveRecord::RecordInvalid)
    end

    it "fails when not attached to a table" do
      lambda {
        @menu = Factory(:menu)
      }.should raise_error(ActiveRecord::RecordInvalid)
    end

  end
  
end
