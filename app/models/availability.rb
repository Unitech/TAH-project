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
