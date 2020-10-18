class CreateNutritions < ActiveRecord::Migration[6.0]
  def change
    create_table :nutritions do |t|
      t.integer :client_id,            null:false, foreign_key: true
      t.integer :user_id,              null:false, foreign_key: true
      t.date :date,                    null:false
      t.integer :six_water_amount,     null:false, default: 0
      t.integer :morning_meal_m_id,    null:false, default: 1
      t.integer :morning_meal_s_id,    null:false, default: 1
      t.integer :morning_water_amount, null:false, default: 0
      t.integer :ten_water_amount,     null:false, default: 0
      t.integer :lunch_meal_m_id,      null:false, default: 1
      t.integer :lunch_meal_s_id,      null:false, default: 1
      t.integer :lunch_water_amount,   null:false, default: 0
      t.integer :fifty_water_amount,   null:false, default: 0
      t.integer :dinner_meal_m_id,     null:false, default: 1
      t.integer :dinner_meal_s_id,     null:false, default: 1
      t.integer :dinner_water_amount,  null:false, default: 0
      t.integer :twenty_water_amount,  null:false, default: 0
      t.timestamps
      t.index [:date, :client_id],     unique: true
    end
  end
end
