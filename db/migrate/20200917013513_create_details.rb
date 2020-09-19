class CreateDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :details do |t|
      t.integer :client_id,        foreign_key: true
      t.text :past_history
      t.text :illness
      t.text :medicine
      t.integer :mbp_high,         null:false
      t.integer :mbp_low,          null:false
      t.timestamps
    end
  end
end
