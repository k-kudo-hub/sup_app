class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.integer :client_id,        null:false
      t.integer :user_id,          null:false
      t.datetime :occ_time,        null:false
      t.integer :place_id,         null:false
      t.integer :genre_id,         null:false
      t.integer :res_id,           null:false
      t.integer :level_id,         null:false
      t.text :content
      t.text :picture
      t.text :coping
      t.integer :contact_id
      t.text :hospital
      t.datetime :desc_date
      t.integer :desc_user
      t.text :desc_content
      t.text :count_content
      t.integer :check_id,         null:false, default: 0
      t.timestamps
    end
  end
end
