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
    
    it "fail when title missing" do
      @table = Table.new(:description => 'asdasd')
      @table.should_not be_valid      
    end

    it "fail when desct missing" do
      @table = Table.new(:title => 'asdasd')
      @table.should_not be_valid
    end

    it "succed when field title and description are filled" do
      @table = Table.new(:title => 'sasadsad', :description => 'asdasdsd')
      @table.should be_valid
    end
  end

end

# == Schema Information
#
# Table name: tables
#
#  id                      :integer         not null, primary key
#  title                   :string(255)
#  description             :text
#  capacity                :integer
#  user_id                 :integer
#  table_available         :boolean
#  theme                   :string(255)
#  created_at              :datetime        not null
#  updated_at              :datetime        not null
#  main_image_file_name    :string(255)
#  main_image_content_type :string(255)
#  main_image_file_size    :integer
#  main_image_updated_at   :datetime
#

