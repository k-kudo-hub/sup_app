class Detail < ApplicationRecord

  belongs_to :client, optional: true

  with_options presence: {message: "が空です"} do
    validates :mbp_high
    validates :mbp_low
  end
  validates :degree_id, :move_id, :meal_id, :excretion_id, :oral_id,      
  numericality:{ other_than: 1 , message: "が選択されていません"}

end
