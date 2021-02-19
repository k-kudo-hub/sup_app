class Message < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :tag

  mount_uploader :picture, PictureUploader

  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    picture.file.present?
  end

  belongs_to :room
  belongs_to :user

  def no_image?
    self.picture.file.nil?
  end

  def not_important?
    [1,2].include?(self.tag_id)
  end

  def caution?
    self.tag_id == 2
  end

  def important?
    self.tag_id == 3
  end

end
