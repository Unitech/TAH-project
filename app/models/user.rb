class User < ActiveRecord::Base  
  serialize :lang

  # Devise
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_protected :encrypted_password,
                 :reset_password_token,
                 :reset_password_sent_at,
                 :remember_created_at,
                 :sign_in_count,
                 :current_sign_in_at,
                 :last_sign_in_at,
                 :current_sign_in_ip,
                 :last_sign_in_ip

  # type field
  class Type < Static::ReferenceData
    HOST = 0
    GUEST = 1
    HOST_N_GUEST = 2
  end

  #
  # Validations
  #
  validates_presence_of :f_name
  validates_presence_of :l_name
  validates_presence_of :email
  validates_presence_of :type

  #
  # Some scopes
  #
  scope :five_last, :order => 'users.created_at DESC', :limit => 5
  
  #
  # Search method
  #
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
