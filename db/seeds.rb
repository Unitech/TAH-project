# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'ffaker'

users = []

5.times do 
  users << User.create(:f_name => Faker::Name.first_name,
                       :l_name => Faker::Name.last_name, 
                       :email => Faker::Internet.email,
                       :status => rand(3),
                       :password => '123456')
end

known = User.create(:f_name => 'Alex',
                    :l_name => 'Strzelewicz',
                    :email => 'strzel_a@epitech.eu',
                    :status => User::Status::HOST_N_GUEST,
                    :password => '123456')
