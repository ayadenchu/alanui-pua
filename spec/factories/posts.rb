FactoryBot.define do
  factory :post do
    title {"title"}
    category_id	{"2"}
    text {Faker::Lorem.sentence}
    image {Faker::Lorem.sentence}
    association :user
  end
end
