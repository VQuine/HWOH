class WorkOrder < ApplicationRecord
    belongs_to :staff_member
    belongs_to :tenant, optional: true
    
    belongs_to :apartment, optional: true
    # belongs_to :building, optional: true
    validates :status, :content, :presence => true

    STATUS_OPTIONS = ["PENDING", "COMPLETE"]

    # ===========================================================
    # IF THIS WORK ORDER HAS A TENANT ATTACHED
    # USE FOR COLLECTION_SELECT data display
    def tenant_name=(name)
        # PASS IN THE NAME that you want to search the database for
        # CALLED WHEN WORKORDER is INITIALIZED w/ 'TENANT_NAME' FIELD
        self.tenant = Tenant.find_by(name: name)
    end

    def tenant_name
        # IF WORK ORDER has a TENANT
        self.tenant ? self.tenant.name : nil
    end
    # ===========================================================
    def tenant_display=(display)
        self.tenant = Tenant.find_by(:full_display => display)
    end
    def tenant_display
        self.tenant ? self.tenant.full_display : nil
    end
    # ===========================================================
    def self.pending_orders
        ##########INSERT LOGIC TO DESCIPHER @WORK_ORDERS = :STATUS = 'PENDING' 
        WorkOrder.where(:status => "PENDING")
    end
end
