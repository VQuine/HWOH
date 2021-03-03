class CreateStaffMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :staff_members do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :position # 'Superintendent', 'Porter', 'Administrator'
      
      t.string :password_digest # Rails uses BCRYPT

      t.string :uid # For Omniauth - uid = request.env['omniauth.auth']
      t.string :provider # For Omniauth - use if there are multiple provider options implemented

      t.timestamps
    end
  end
end
 