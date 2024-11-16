FactoryBot.define do
  factory :task, class: Product::Todo::Task do
    association :user
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraphs }
    deadline { Faker::Date.forward }
  end
end
