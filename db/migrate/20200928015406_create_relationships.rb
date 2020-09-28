class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|
      t.references :user,       foreign_key: true
      t.references :client,     foreign_key: true

      t.timestamps
      t.index [:user_id, :client_id], unique: true
    end
  end
end
