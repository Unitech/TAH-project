class User < ActiveRecord::Base  
  serialize :lang

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  
  attr_accessible :email, :password, :password_confirmation, :remember_me

  scope :five_last, :order => 'users.created_at DESC', :limit => 5
  
  class << self
    def search(q)
      [:f_name, :l_name, :description].inject(scoped) do |combined_scope, attr|
        combined_scope.where("users.#{attr} LIKE ?", "%#{q}%")
      end
    end
  end
  
  # Get all users that have published a post
  # scope :published, lambda {
  #   joins("join posts on posts.author_id = users.id").
  #   where("posts.published_at IS NOT NULL AND posts.published_at <= ?", Time.zone.now).
  #   group("users.id")
  # }
  
  # # Get all users that have commented on a post
  # scope :commented, joins("join comments on comments.user_id = users.id").group("users.id")
end
