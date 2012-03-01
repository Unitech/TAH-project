class Dish < ActiveRecord::Base
  belongs_to :menu
  
  
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
#

