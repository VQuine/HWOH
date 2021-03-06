class CreateWorkOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :work_orders do |t|
        t.string :status
        t.string :content
        t.string :solution
        t.string :solve_date
        t.string :worker
        
        # FOREIGN KEY - BELONGS_TO RELATIONSHIP
        t.integer :staff_member_id
        t.integer :tenant_id #this is optional

        t.integer :building_id
        t.integer :apartment_id

      t.timestamps
    end
  end
end
