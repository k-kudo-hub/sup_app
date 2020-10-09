class AddInsuranceToClients < ActiveRecord::Migration[6.0]
  def change
    add_column :clients, :insurance, :integer
  end
end
