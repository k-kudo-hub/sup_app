class Caregiver < ApplicationRecord
  belongs_to :client, optional: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :care
  belongs_to_active_hash :degree
  belongs_to_active_hash :cognition

  validates :degree_id, :cognition_id, :move_id, :meal_id, :excretion_id, :oral_id, :bathing_id,
            numericality: { other_than: 1, message: 'が選択されていません' }

  def move_status
    Care.find(self.move_id).name
  end

  def meal_status
    Care.find(self.meal_id).name
  end

  def excretion_status
    Care.find(self.excretion_id).name
  end

  def oral_status
    Care.find(self.oral_id).name
  end

  def bathing_status
    Care.find(self.bathing_id).name
  end
end
