class Table < ActiveRecord::Base
  belongs_to :user
  has_many :menus, :dependent => :destroy

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
