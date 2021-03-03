class Tenant < ApplicationRecord
    validates :first_name, :last_name, :phone, :presence => true
    before_validation :full_displayify

    belongs_to :staff_member
    has_many :work_orders

    # belongs_to :building
    belongs_to :apartment



    private
    def full_displayify
        self.full_display = "#{self.apartment.building.number}-#{self.apartment.number} : #{self.name}"
    end
    
end
