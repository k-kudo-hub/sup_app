class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :name,            null:false
      t.string :name_kana,       null:false
      t.date :birth,             null:false
      t.integer :room_number,    null:false
      t.text :picture
      t.integer :status_id,      null:false
      t.timestamps
    end
  end
end
