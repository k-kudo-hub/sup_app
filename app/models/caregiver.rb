class Caregiver < ApplicationRecord
  
  belongs_to :client, optional: true

extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :care
  belongs_to_active_hash :degree
  belongs_to_active_hash :cognition

  validates :degree_id, :cognition_id, :move_id, :meal_id, :excretion_id, :oral_id, :bathing_id,      
            numericality:{ other_than: 1 , message: "が選択されていません"}
end
