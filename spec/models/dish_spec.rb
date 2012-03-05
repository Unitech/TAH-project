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

# == Schema Information
#
# Table name: dishes
#
#  id                      :integer         not null, primary key
#  title                   :string(255)
#  description             :text
#  menu_id                 :integer
#  created_at              :datetime        not null
#  updated_at              :datetime        not null
#  position                :integer
#  main_image_file_name    :string(255)
#  main_image_content_type :string(255)
#  main_image_file_size    :integer
#  main_image_updated_at   :datetime
#  category                :integer
#

