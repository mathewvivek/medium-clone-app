FactoryGirl.define do
  factory :user do
    username { "user1" }
    email { "usermail@factory.com" }
    password { "userpassword" }
  end
end