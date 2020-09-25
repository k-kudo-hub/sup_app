class Client < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :status

  has_one :detail, dependent: :destroy
  has_one :caregiver, dependent: :destroy
  has_one :room, dependent: :destroy

  with_options presence: {message: "が空です"} do
    validates :name
    validates :name_kana,   format:{with:/\A[ァ-ヶー－]+\z/, message:"は全角カタカナのみ登録できます。"}
    validates :birth
    validates :room_number, format:{with: /\A[0-9]+\z/, message:"は数字のみ登録できます。"}
  end
    validates :status_id,   numericality:{ other_than: 1 , message: "が選択されていません。"}

end
