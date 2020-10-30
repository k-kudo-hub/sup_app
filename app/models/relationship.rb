class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :client

  validates :user_id, presence: true
  validates :client_id, presence: true
end
