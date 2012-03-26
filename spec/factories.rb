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

Factory.define :table do |t|
  t.sequence(:title) { |n| "Title#{n}" }
  t.description { Faker::Lorem.paragraph }
end

Factory.define :menu do |m|
  #m.price { rand(300) }
  m.description { Faker::Lorem.paragraph }
  #m.category { rand(Menu::Category.size) }
  m.sequence(:title) { |n| "menu-#{n}" }
end

Factory.define :dish do |d|
  d.sequence(:title) { |n| "dish-#{n}" }
  d.sequence(:description) { |n| "desc-#{n}" }
end
