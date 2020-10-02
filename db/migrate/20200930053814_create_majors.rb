class CreateMajors < ActiveRecord::Migration[6.0]
  def change
    create_table :majors do |t|

      t.timestamps
    end
  end
end
