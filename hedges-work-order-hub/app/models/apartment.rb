class Apartment < ApplicationRecord
    belongs_to :building

    before_validation :short_addressify
    # before_save :short_addressify
    before_validation :long_addressify
    
    # TENANT join table
    has_many :tenants
    has_many :work_orders, through: :tenants

    accepts_nested_attributes_for :work_orders

    # PLUG IN the FORMULA AND THE STUFF
        private
        def short_addressify
            self.short_address = self.building.number + "-" + self.number
        end
        
        def long_addressify
            self.long_address = "#{self.building.number}-#{self.number} #{self.building.street_address}"
        end
end
