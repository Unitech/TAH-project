class Menu < ActiveRecord::Base
  belongs_to :table
  has_many :menu
end
