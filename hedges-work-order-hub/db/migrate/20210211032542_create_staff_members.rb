class CreateStaffMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :staff_members do |t|
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
