class CreateBuildings < ActiveRecord::Migration[6.1]
  def change
    create_table :buildings do |t|
      t.string :number
      t.string :street_address

      t.integer :staff_member_id

      t.timestamps
    end
  end
end
  