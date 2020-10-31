class Client < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :status
  belongs_to_active_hash :sex

  has_one :detail, dependent: :destroy
  has_one :caregiver, dependent: :destroy
  has_one :room, dependent: :destroy
  has_many :relationships
  has_many :users, through: :relationships
  has_many :records
  has_many :reports
  has_many :nutritions

  mount_uploader :picture, PictureUploader

  with_options presence: { message: 'が入力されていません。' } do
    validates :name
    validates :name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナのみ登録できます。' }
    validates :birth
    validates :room_number, format: { with: /\A[0-9]+\z/, message: 'は数字のみ登録できます。' }
    validates :sex_id, numericality: { other_than: 1, message: 'が選択されていません。' }
  end
  validates :status_id, numericality: { other_than: 1, message: 'が選択されていません。' }
end
