FactoryGirl.define do
  factory :message do
    body { Faker::Lorem.characters(150) }
  end

end
