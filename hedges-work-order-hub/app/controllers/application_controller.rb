class ApplicationController < ActionController::Base

def logged_in?
    !!current_staff_member #!!!!!!!!!!!!!!!!!!!!!!!PlEASE MEMORIZE DOUBLE BANG
end

def current_staff_member
    if session[:staff_member_id]
        @staff_member ||= StaffMember.find(session[:staff_member_id])
    end
end

helper_method :current_staff_member
# THIS METHOD CAN NOW BE CALLED INSIDE OF VIEWS
end
