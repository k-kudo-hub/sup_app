FactoryBot.define do
  factory :record do
    association :client
    client_id             {1}
    user_id               {1}
    start_time            {Time.now - 2.minute}
    end_time              {Time.now - 1.minute}
    major_item_id         {2}
    main_item_id          {3}
    sub_item_id           {11}
    remind                {1}
    carryout_id           {1}
    exc_shape_id          {Faker::Number.between(from: 0, to: 5)}
    exc_amount_id         {Faker::Number.between(from: 0, to: 5)}
    urine_amount          {Faker::Number.between(from: 0, to: 300)}
    memo                  {"特変なし。"}
  end
end
