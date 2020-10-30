class Detail < ApplicationRecord
  belongs_to :client, optional: true

  with_options presence: { message: 'が空です' } do
    validates :mbp_high,    numericality: { only_integer: true, message: 'は半角数字で入力してください' }
    validates :mbp_low,     numericality: { only_integer: true, message: 'は半角数字で入力してください' }
  end
end
