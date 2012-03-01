class UserTable < ActiveRecord::Base
  belongs_to :user
  belongs_to :table
end

# == Schema Information
#
# Table name: user_tables
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  table_id   :integer
#  status     :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

