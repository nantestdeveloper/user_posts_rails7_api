FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
  end
  factory :user do
    name { Faker::Lorem.sentence }
    email { Faker::Lorem.paragraph }
  end
end