class Menu < ActiveRecord::Base
  belongs_to :table
  has_many :dishes, :dependent => :destroy
  accepts_nested_attributes_for :dishes, 
                                :reject_if => lambda { |a| a[:title].blank? }, 
                                :allow_destroy => true

  has_many :availabilities, :dependent => :destroy

  # Paperclip (Image)
  has_attached_file :main_image, :styles => { 
    :table_page => "960x300#", 
    :small => "300x150#",
    :icon => "50x50#"
  }

  class Category < Static::ReferenceData    
    DINER = 0
    BRUNCH = 1
  end

  #
  # Validation
  #
  validates :title,
            :presence => true,
            :length => { :minimum => 2, :maximum => 160 }
            
  validates :description,
            :presence => true

  validates :price, 
            :numericality => true,
            :inclusion => 1..3000,
            :if => Proc.new { |menu| menu.price.presence }
 
  validates :category,
            :inclusion => 0..self::Category.size,
            :numericality => true,
            :if => Proc.new { |menu| menu.category.presence }

  validates :table_id,
            :presence => true,
            :numericality => true


  # "#{id}-#{title.gsub(/[^a-z0-9]+/i, '-')}" 

  def to_param
    self.id.to_s + '-' + self.title.parameterize
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

