class Client < ApplicationRecord

  has_one :detail
  has_one :room

  with_options presence: {message: "が空です"} do
    validates :name
    validates :name_kana,          format:{with:/\A[ァ-ヶー－]+\z/, message:"は全角カタカナのみ登録できます。"}
    validates :birth,:room_number, format:{with: /\A[0-9]+\z/, message:"は数字のみ登録できます。"}
  end
  validates :status_id,      numericality:{ other_than: 1 , message: "が選択されていません"}

end
