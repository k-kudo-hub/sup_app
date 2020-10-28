class Nutrition < ApplicationRecord
  belongs_to :client

  with_options presence: {message: "が入力されていません。"} do
    validates :six_water_amount, :morning_water_amount, :ten_water_amount,
    :lunch_water_amount, :fifty_water_amount, :dinner_water_amount, :twenty_water_amount,
    numericality: { only_integer: true, message: "は数字で入力してください。" }
    validates :morning_meal_m_id, :morning_meal_s_id, :lunch_meal_m_id, 
    :lunch_meal_s_id, :dinner_meal_m_id, :dinner_meal_s_id,
    numericality: { other_than: 0 , message: "が選択されていません"}
    validates :client_id
    validates :user_id
    validates :date
  end
end
