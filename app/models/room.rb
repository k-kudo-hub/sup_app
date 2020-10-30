class Room < ApplicationRecord
  belongs_to :client
  has_many :room_users, dependent: :destroy
  has_many :users, through: :room_users
  has_many :messages, dependent: :destroy

  validates :client_id, uniqueness: { message: 'このお客様のチャットルームはすでに存在します。' }
end
