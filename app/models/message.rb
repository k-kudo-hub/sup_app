class Message < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :tag

  mount_uploader :picture, PictureUploader

  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.picture.file.present?
  end

  belongs_to :room 
  belongs_to :user

end
