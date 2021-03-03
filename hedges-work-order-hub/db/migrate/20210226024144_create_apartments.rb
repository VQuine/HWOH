class CreateApartments < ActiveRecord::Migration[6.1]
  def change
    create_table :apartments do |t|
      t.string :number

      t.string :short_address
      t.string :long_address

      t.integer :staff_member_id
      
      t.integer :building_id

      t.timestamps
    end
  end
end
 