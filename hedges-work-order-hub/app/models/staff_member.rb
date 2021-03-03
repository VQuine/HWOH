class StaffMember < ApplicationRecord
    has_many :work_orders
    # ============================================================
    has_secure_password
    # ADDS #PASSWORD & #PASSWORD_CONFIRMATION | EXPECTS :PASSWORD_DIGEST | 'BCRYPT' GEM
    # ADDS HOOKS - #BEFORE_SAVE : COMPARES PASSWORD & PASSWORD_CONFIRMATION
    # ============================================================
    validates :first_name, :last_name, :presence => true

    def self.create_from_omniauth(response) #since this came from a button that is for signup&login      
            StaffMember.find_or_create_by(:uid => response[:uid], :provider => response[:provider]) do |sm|
                sm.first_name = response[:info][:first_name]
                sm.last_name = response[:info][:last_name]
                sm.email = response[:info][:email]
                sm.password = SecureRandom.hex(15) #USER NEVER SEES THIS SO WHAT'S THE POINT
                sm.password_confirmation = sm.password #USER NEVER SEES THIS SO WHAT'S THE POINT
            end       
    end

    

end
