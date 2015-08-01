FactoryGirl.define do
  factory :user do
    email {Faker::Internet.email}
    password { Faker::Internet.password }
    name { Faker::Name.name }
    handle { Faker::Internet.user_name }
  end

end
