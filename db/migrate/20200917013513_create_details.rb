class CreateDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :details do |t|
      t.integer :client_id,        null:false, foreign_key: true
      t.integer :degree_id,        null:false
      t.text :past_history
      t.text :illness
      t.text :medicine
      t.integer :mbp_high,         null:false
      t.integer :mbp_low,          null:false
      t.integer :move_id,          null:false
      t.text :move_exp 
      t.integer :meal_id,          null:false
      t.text :meal_exp
      t.integer :excretion_id,     null:false
      t.text :excretion_exp
      t.integer :oral_id,          null:false
      t.text :oral_exp
      t.timestamps
    end
  end
end
