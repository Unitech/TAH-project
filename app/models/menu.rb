class Menu < ActiveRecord::Base
  belongs_to :table
  has_many :dishes, :dependent => :destroy
  accepts_nested_attributes_for :dishes, :reject_if => lambda { |a| a[:title].blank? }, :allow_destroy => true

  def to_param
    self.id.to_s + '-' + self.title.parameterize
  end
end
