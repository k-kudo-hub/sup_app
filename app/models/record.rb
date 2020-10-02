class Record < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :major
    belongs_to_active_hash :main
    belongs_to_active_hash :sub

  belongs_to :client

end
