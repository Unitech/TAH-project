class Table < ActiveRecord::Base
  belongs_to :user
  has_many :menus, :dependent => :destroy

  # Paperclip (Image)
  has_attached_file :main_image, :styles => { 
    :table_page => "960x300#", 
    :small => "300x150#",
    :icon => "50x50#"
  }
  
  # validates_attachment_presence :main_image
  # validates_attachment_size :main_image, :less_than => 5.megabytes
  # validates_attachment_content_type :main_image, :content_type => ['image/jpeg', 'image/png']

  #validates_presence

  def table_belongs_to_user? user
    if self.user_id == user.id
      return true
    end
    return false
  end

  def menu_count
    return self.menus.count
  end

  def step_one?
    (self.title and self.description) ? true : false
  end

  def step_two?
    self.menus.presence ? true : false
  end
  
  def step_three?
    false
  end

  def to_param
    self.id.to_s + '-' + self.title.parameterize
  end
end
