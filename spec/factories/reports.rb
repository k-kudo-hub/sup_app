FactoryBot.define do
  factory :report do
    association :client
    client_id             {1}
    user_id               {1}
    occ_time              {Time.current - 10.minute}
    place_id              {2}
    genre_id              {2}
    res_id                {2}
    level_id              {2}
    content               {'10:00、物音がしたため訪室。'}
    picture               {''}
    coping                {'事故発見後すぐに応援のスタッフを要請した'}
    contact_id            {2}
    hospital              {'厚生中央病院'}
    desc_date             {Date.yesterday}
    desc_user             {2}
    desc_content          {'長男〇〇様受話。状況の報告と謝罪を行った。'}
    count_content         {'事故の原因として3点が挙げられる。'}
    check_id              {0}
  end
end
