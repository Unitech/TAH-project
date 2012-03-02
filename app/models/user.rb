class User < ActiveRecord::Base  
  # contrat a cocher
  # validates :terms_of_service, :acceptance => true

  # 
  # to move in observer
  # 
  after_initialize :init_user

  serialize :lang

  has_many :tables

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
  class Status < Static::ReferenceData
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
  validates_presence_of :status

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

  protected
  def init_user
    self.status ||= User::Status::HOST
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

# == Schema Information
#
# Table name: users
#
#  id                     :integer         not null, primary key
#  f_name                 :string(255)
#  l_name                 :string(255)
#  phone                  :string(255)
#  lang                   :text
#  age                    :integer
#  description            :text
#  status                 :integer
#  job                    :string(255)
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(255)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#

