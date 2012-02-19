Factory.define :user do |f|
  f.sequence(:email) { |n| "test-#{n}@gmail.com" }
  f.password("secret")
end

