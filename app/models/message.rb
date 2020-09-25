class Message < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :tag

  belongs_to :room 
  belongs_to :user

  

end
