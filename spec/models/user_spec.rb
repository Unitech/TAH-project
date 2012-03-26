require 'spec_helper'

describe User do
  
  before(:each) do
    @user = Factory(:user)
  end

  it "fails when wrong email" do
    lambda {
      @user = Factory(:user,
                      :f_name => 'asddsa',
                      :l_name => 'ooooo',
                      :email => 'asdsdadaasd')
    }.should raise_error(ActiveRecord::RecordInvalid)
  end
  
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

