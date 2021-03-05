class StaffMembersController < ApplicationController
    # ============================================================
    # REQUIRE THAT A USER BE LOGGED IN (THE '#REQUIRE_LOGIN' BEFORE ANYTHING ELSE FOR ACTIONS
    # before_action :require_login
    # EXCEPT FOR THE INDEX ACTION
    # skip_before_action :require_login, only: [:index]
    # ============================================================

    def show
        @staff_member = StaffMember.find(params[:id])
    end
    
    def index
         @staff_members = StaffMember.all
    end
#SIGN UP A NEW STAFF MEMBER
    def new
        
        
        @staff_member = StaffMember.new
        # ∟ PREPOPULATES WITH FORM_FOR - PREPOPULATE WITH USER'S INPUTS
        render :new
    end

    # POST INFO FROM THE NEW ROUTE TO CREATE A NEW STAFF_MEMBER
    def create

        @staff_member = StaffMember.new(staff_member_params)

        if @staff_member.valid?
            @staff_member.save
            session[:staff_member_id] = @staff_member.id
            redirect_to staff_member_path(@staff_member)
        else
            render :new
        end
        
    end

    def edit
        @staff_member = StaffMember.find_by_id(params[:id])
    end

    def update
        @staff_member = StaffMember.find_by_id(params[:id])
        @staff_member.update(staff_member_params)
        redirect_to staff_member_path(@staff_member)
    end

    def destroy
        @staff_member = StaffMember.find_by_id(params[:id])
        @staff_member.destroy
        redirect_to signup_path

    end

    def step_2
        #DOES THE URL SEGMENT HAVE A MATCH IN THE DB
        @staff_member = StaffMember.find_by_id(params[:id])
        # CHECK THE SESSION..IF THERE'S AN ID THERE
        @smid = session[:staff_member_id]

        if @staff_member.id == @smid
            render :step_2
        else 
            redirect_to :new
        end
    end

        private
            def staff_member_params
                params.require(:staff_member).permit(:first_name, :last_name,
                                                        :position, :email,
                                                        :uid, :provider,
                                                        :password, :password_confirmation)
            end

            # def require_login
            #     return head(:forbidden) unless session.include? :user_id
            # end


end
