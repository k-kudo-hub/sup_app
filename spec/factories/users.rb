FactoryBot.define do
  factory :user do
    name                  {Faker::Name.initials(number: 2)}
    name_kana             {'サポート'}
    staff_number          {'123456'}
    email                 {Faker::Internet.free_email}
    password              {'support1234'}
    password_confirmation {password}
    position_id           {2}
    qualification_id      {2}
    work_style_id         {2}
  end
end
