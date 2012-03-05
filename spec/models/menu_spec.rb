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

# == Schema Information
#
# Table name: menus
#
#  id                      :integer         not null, primary key
#  status                  :integer
#  title                   :string(255)
#  price                   :integer
#  option                  :text
#  description             :text
#  participation_cooking   :boolean
#  table_id                :integer
#  created_at              :datetime        not null
#  updated_at              :datetime        not null
#  main_image_file_name    :string(255)
#  main_image_content_type :string(255)
#  main_image_file_size    :integer
#  main_image_updated_at   :datetime
#  category                :integer
#

