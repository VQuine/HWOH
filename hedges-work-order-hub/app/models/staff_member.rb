class StaffMember < ApplicationRecord
    has_many :work_orders
    # ============================================================
    has_secure_password
    # ADDS #PASSWORD & #PASSWORD_CONFIRMATION | EXPECTS :PASSWORD_DIGEST | 'BCRYPT' GEM
    # ADDS HOOKS - #BEFORE_SAVE : COMPARES PASSWORD & PASSWORD_CONFIRMATION
    # ============================================================
    validates :first_name, :last_name, :presence => true
    




    def self.find_with_omniauth_login(response)
        # I WISH TO CARRY THIS FROM A BUTTON PRESS - session[:signup_or_login] = "login"
        return StaffMember.find_by(:uid => response[:uid], :provider => response[:provider])
# byebug
    end




    def self.new_from_omniauth(response) #since this came from a button that is for signup&login      
            sm = StaffMember.new(:uid => response[:uid], :provider => response[:provider])
             sm.first_name = response[:info][:first_name]
             sm.last_name = response[:info][:last_name]
             sm.email = response[:info][:email]
             sm.password = SecureRandom.hex(15) #USER NEVER SEES THIS SO WHAT'S THE POINT
             sm.password_confirmation = sm.password #USER NEVER SEES THIS SO WHAT'S THE POINT   
             sm
    end


    

end 
