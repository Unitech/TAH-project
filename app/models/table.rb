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

class Table < ActiveRecord::Base
  belongs_to :user
  has_many :menus, :dependent => :destroy
  has_one :address, :dependent => :destroy

  # Paperclip (Image)
  has_attached_file :main_image, :styles => { 
    :table_page => "960x300#", 
    :small => "300x150#",
    :icon => "50x50#"
  }
  
  validates_attachment_size :main_image, :less_than => 5.megabytes
  validates_attachment_content_type :main_image, :content_type => ['image/jpeg', 'image/png']

  validates :title,
            :presence => true,
            :length => { :minimum => 2, :maximum => 160 }

  validates :description,
            :presence => true

  validates :user_id,
            :presence => true,
            :numericality => true
  
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


