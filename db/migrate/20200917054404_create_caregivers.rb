class CreateCaregivers < ActiveRecord::Migration[6.0]
  def change
    create_table :caregivers do |t|
      t.integer :client_id,        null:false, foreign_key: true
      t.integer :degree_id,        null:false
      t.integer :cognition_id,     null:false
      t.integer :move_id,          null:false
      t.text :move_exp 
      t.integer :meal_id,          null:false
      t.text :meal_exp
      t.integer :excretion_id,     null:false
      t.text :excretion_exp
      t.integer :oral_id,          null:false
      t.text :oral_exp
      t.integer :bathing_id,       null:false
      t.text :bathing_exp
      t.timestamps
    end
  end
end
