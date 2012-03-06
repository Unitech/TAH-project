# == Schema Information
#
# Table name: addresses
#
#  id         :integer         not null, primary key
#  address1   :string(255)
#  address2   :string(255)
#  city       :string(255)
#  region     :string(255)
#  zipcode    :string(255)
#  country    :string(255)
#  latitude   :float
#  longitude  :float
#  floor      :integer
#  code       :string(255)
#  code2      :string(255)
#  table_id   :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Address < ActiveRecord::Base

  belongs_to :table

  validates :address1,
            :presence => true
  
  validates :city,
            :presence => true

  validates :zipcode,
            :presence => true

  validates :country,
            :presence => true

  validates :longitude,
            :presence => true,
            :numericality => true

  validates :latitude,
            :presence => true,
            :numericality => true

  attr_protected :id

  
  
end

