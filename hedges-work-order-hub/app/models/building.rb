class Building < ApplicationRecord
    validates :number, :street_address, presence: true
        belongs_to :staff_member #the user that registered it
        has_many :apartments

        
        # TENANTS is a JOIN TABLE
        has_many :tenants
        has_many :work_orders, through: :tenants
end 
