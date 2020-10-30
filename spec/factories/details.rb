FactoryBot.define do
  factory :detail do
    past_history        {'糖尿病'}
    illness             {'糖尿病、アルツハイマー型認知症、徐脈'}
    medicine            {'ビグアナイド錠'}
    mbp_high            {180}
    mbp_low             {90}
  end
end
