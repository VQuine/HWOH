class CreateTenants < ActiveRecord::Migration[6.1]
  def change
    create_table :tenants do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      

      t.string :name
      
      t.string :full_display

      # FOREIGN KEYS
      t.integer :staff_member_id
      # t.integer :building_id
      t.integer :apartment_id

      t.timestamps
    end
  end
end
