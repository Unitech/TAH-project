class DishSample < ActiveRecord::Base  
  has_attached_file :image, :styles => { 
    :small => "50x50#",
    :medium => "150x150#"
  }

  validates_presence_of :title

  
  
end

# == Schema Information
#
# Table name: dish_samples
#
#  id                 :integer         not null, primary key
#  title              :string(255)
#  description        :text
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#

