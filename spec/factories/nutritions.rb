FactoryBot.define do
  factory :nutrition do
    association :client
    client_id              {1}
    user_id                {1}
    date                   {Date.yesterday}
    six_water_amount       {Faker::Number.between(from: 1, to: 200)}
    morning_meal_m_id      {Faker::Number.between(from: 1, to: 11)}
    morning_meal_s_id      {Faker::Number.between(from: 1, to: 11)}
    morning_water_amount   {Faker::Number.between(from: 1, to: 200)}
    ten_water_amount       {Faker::Number.between(from: 1, to: 200)}
    lunch_meal_m_id        {Faker::Number.between(from: 1, to: 11)}
    lunch_meal_s_id        {Faker::Number.between(from: 1, to: 11)}
    lunch_water_amount     {Faker::Number.between(from: 1, to: 200)}
    fifty_water_amount     {Faker::Number.between(from: 1, to: 200)}
    dinner_meal_m_id       {Faker::Number.between(from: 1, to: 11)}
    dinner_meal_s_id       {Faker::Number.between(from: 1, to: 11)}
    dinner_water_amount    {Faker::Number.between(from: 1, to: 200)}
    twenty_water_amount    {Faker::Number.between(from: 1, to: 200)}    
  end
end
