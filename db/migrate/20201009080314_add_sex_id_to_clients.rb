class AddSexIdToClients < ActiveRecord::Migration[6.0]
  def change
    add_column :clients, :sex_id, :integer
  end
end
