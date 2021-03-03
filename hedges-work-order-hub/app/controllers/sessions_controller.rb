class SessionsController < ApplicationController
    
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
    
    # THIS IS for THE CALLBACK FROM GOOGLE AFTER USER SUCCESSFULLY LOGS IN WITH IT
    def omniauth        

        @staff_member = StaffMember.find_or_create_from_omniauth(request.env['omniauth.auth']) #finds or creates a SM with data

        if @staff_member.valid?
            session[:staff_member_id] = @staff_member.id #create the session - LOG THEM IN
            redirect_to staff_member_path(@staff_member)
        else
            redirect_to '/login'
        end
    end





end
