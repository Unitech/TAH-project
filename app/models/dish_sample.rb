class DishSample < ActiveRecord::Base  
  has_attached_file :image, :styles => { 
    :small => "50x50#",
    :medium => "150x150#"
  }

  validates_presence_of :title

  
  
end
