FactoryBot.define do
  factory :room do
    association :client
    id {Faker::Number.between(from: 1, to: 100)}
  end
end
