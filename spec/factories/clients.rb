FactoryBot.define do
  factory :client do
    id                    {1}
    name                  {'鈴木太郎'}
    name_kana             {'スズキタロウ'}
    room_number           {444}
    status_id             {2}
    sex_id                {2}
    birth                 {Faker::Date.between(from: '1920-01-01', to: '2015-12-31')}
    careplan              {3000}
    insurance             {12_345_678}
  end
end
