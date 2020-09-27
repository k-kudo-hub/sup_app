class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.integer :room_id,        null: false, foreign_key: true
      t.integer :user_id,        null: false, foreign_key: true
      t.text :content,           null: false
      t.text :picture
      t.integer :tag_id
      t.timestamps
    end
  end
end
