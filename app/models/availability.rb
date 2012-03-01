class Availability < ActiveRecord::Base
  belongs_to :menu

  # when serving json, permits to attach menu title
  attr_accessor :title
  
  def for_calendar
    {
      'title' => title, 
      'start' => self.start, 
      'end' => self.end, 
      'menu_id' => self.menu_id,
      'id' => self.id
    }
  end

end

# == Schema Information
#
# Table name: availabilities
#
#  id         :integer         not null, primary key
#  available  :boolean
#  start      :datetime
#  end        :datetime
#  menu_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

