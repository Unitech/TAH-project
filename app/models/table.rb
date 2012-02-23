class Table < ActiveRecord::Base
  belongs_to :user
  has_many :menus

  def table_belongs_to_user? user
    if self.user_id == user.id
      return true
    end
    return false
  end

  def to_param
    self.id.to_s + '-' + self.title.parameterize
  end
end
