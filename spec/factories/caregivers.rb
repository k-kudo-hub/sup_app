FactoryBot.define do
  factory :caregiver do
    degree_id        { Faker::Number.between(from: 2, to: 6)}
    cognition_id     {Faker::Number.between(from: 2, to: 9)}
    move_id          {Faker::Number.between(from: 2, to: 5)}
    move_exp         {'付き添い歩行'}
    meal_id          {Faker::Number.between(from: 2, to: 5)}
    meal_exp         {'食事介助必要'}
    excretion_id     {Faker::Number.between(from: 2, to: 5)}
    excretion_exp    {'パッド450使用'}
    oral_id          {Faker::Number.between(from: 2, to: 5)}
    oral_exp         {'上義歯あり、自己着脱不可'}
    bathing_id       {Faker::Number.between(from: 2, to: 5)}
    bathing_exp      {'またぎ不安定'}
  end
end
