Factory.define :user do |f|
  f.sequence(:l_name) { |n| "LName#{n}" }
  f.sequence(:f_name) { |n| "LName#{n}" }
  f.sequence(:email) { |n| "test-#{n}@gmail.com" }
  f.phone { Faker::PhoneNumber.phone_number }
  f.description { Faker::Lorem.paragraph }
  f.age { rand(21) + 4 }
  f.job { Faker::Lorem.words(1) }
  
  f.password "secret"
  f.password_confirmation "secret"  
end


