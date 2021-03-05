class SessionsController < ApplicationController

    # APPLICATION COVER PAGE - ROOT LANDING - '/'
    def woh
        render 'sessions/woh_cover'
    end
    
    
    #LOGGED IN STAFFMEMBERS DIRECTORY 
    def hub
        if session[:staff_member_id]
            @work_orders = WorkOrder.pending_orders
            render :hub
        else
            redirect_to login_path
        end
    end
    
    # THE GET LOG IN ROUTE
    def new
        @staff_member = StaffMember.new #help the form prepopulate with a blank instance
    end
    
    # THE POST LOG IN ROUTE
    def create 
        # if RESPONSE FROM GOOGLE EXISTS
        #     STAFFMEMBER.FINDBY UID
            


        @staff_member = StaffMember.find_by(:email => params[:email]) # FIND SM with input email
        if @staff_member && @staff_member.authenticate(params[:password]) # PASSWORD_digest values match
            session[:staff_member_id] = @staff_member.id #create a SESSION | Log them in
            # redirect_to staff_member_path(@staff_member) #take to SHOW route
            redirect_to '/hub'
        else
            flash[:error] = "Invalid Credentials - please, try again." #supply user with error message
            render :new #rerender the LOG IN FORM
        end
    end
    
    def destroy
        reset_session    
        redirect_to login_path
    end
    
    # THIS IS for THE CALLBACK FROM GOOGLE AFTER USER SUCCESSFULLY LOGS IN | SIGNS UP WITH IT
    #   :uid => r[:uid], :provider => r[:provider]
    def omniauth        
        r = request.env['omniauth.auth'] #grab the returnedGoogleUser data

# CHECK DATABASE
        @staff_member = StaffMember.find_with_omniauth_login(r)
# byebug
        # SM exists in database, log them in, redirect
        if @staff_member != nil
            session[:staff_member_id] = @staff_member.id #create the session - LOG THEM IN
            flash[:message] = "Staff Member successfully logged in with Google!"
# byebug
            redirect_to '/hub'
        elsif @staff_member == nil
        # SM does NOT EXIST, make a .NEW one, SAVE it, LOG THEM IN, send to ACCOUNT page
            @staff_member = StaffMember.new_from_omniauth(r)
# byebug
            if @staff_member.save
                session[:staff_member_id] = @staff_member.id
                flash[:message] = "New Staff Member successfully signed up with Google!"
                redirect_to staff_member_path(@staff_member)
            else
                flash[:error] = "ERORR - StaffMember could not save with GMAILreturnData"
                redirect_to '/signup'                
            end
        else
            "I don't understand"
        end
    end





end
