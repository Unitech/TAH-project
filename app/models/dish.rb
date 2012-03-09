# == Schema Information
#
# Table name: dishes
#
#  id                 :integer         not null, primary key
#  title              :string(255)
#  description        :text
#  menu_id            :integer
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#  position           :integer
#  category           :integer
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Dish < ActiveRecord::Base
  belongs_to :menu
  
  validates :title,
            :presence => true,
            :length => { :minimum => 3, :maximum => 160 }
  
  validates :menu_id,
            :presence => true,
            :numericality => true
  
  validates :description,
            :presence => true


  has_attached_file :image, :styles => { 
    :small => "50x50#",
    :medium => "150x150#"
  }

  def to_param
    self.id.to_s + '-' + self.title.parameterize
  end

end


