class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.references :client,       null:false, foreign_key: true
      t.references :user,         null:false, foreign_key: true
      t.datetime :start_time,     null:false
      t.datetime :end_time,       null:false
      t.integer :major_item_id,   null:false
      t.integer :main_item_id,    null:false
      t.integer :sub_item_id,     null:false
      t.boolean :remind
      t.integer :carryout_id,     null:false
      t.integer :exc_shape_id
      t.integer :exc_amount_id
      t.integer :urine_amount,    default: 0
      t.text :memo
      t.timestamps
    end
  end
end
