class WorkOrdersController < ApplicationController

    def new
        @work_order = WorkOrder.new
        @apt_toggle = ""
        if params[:apartment_id]
            @apt_toggle = params[:apartment_id]
            @apt = Apartment.find_by(params[:apartment_id])
        end
        render :new
    end

    def create

        
        @work_order = WorkOrder.new(work_order_params)
        @work_order.staff_member = current_staff_member
    
        if @work_order.save
            redirect_to apartment_work_order_path(@work_order.tenant.apartment, @work_order)
        else
            if params[:apartment_id]
                @apt_toggle = params[:apartment_id]
                @apt = Apartment.find_by(params[:apartment_id])
            end
            "work order CREATE failure"
            render :new
        end
    end

    def show
        @work_order = WorkOrder.find_by_id(params[:id])
    end

    def edit
        if params[:apartment_id]
            @work_order = WorkOrder.find_by(:id => params[:id])
            @apartment = Apartment.find_by_id(params[:apartment_id])
        else
            @work_order = WorkOrder.find_by_id(params[:id])
        end
    end

    def update
        @work_order = WorkOrder.find_by_id(params[:id])
        @work_order.update(work_order_params)

        @tenant = Tenant.find_by_name(params[:work_order][:tenant_name])
        @work_order.tenant_id = @tenant.id

        if @work_order.save
            redirect_to apartment_work_order_path(@work_order)
        else
            render :edit
        end

    end

    def destroy
        @work_order = WorkOrder.find_by_id(params[:id])
        @work_order.destroy
        redirect_to new_work_order_path
    end

    def index # FEATURES [[[NESTED ROUTE CONDITIONAL!!!]]]
        #'/APARTMENTS/:APARTMENT_ID/WORK_ORDERS'
    
        if params[:apartment_id]
            @apartment = Apartment.find_by(:id => params[:apartment_id])
            @work_orders = @apartment.work_orders
    
        
        #'/BUILDINGS/:BUILDING_ID/WORK_ORDERS'
        elsif params[:building_id]
            @building = Building.find_by_id(params[:building_id])
            @apartments = Apartment.find_by_building_id(@building.id)
            @work_orders = @apartments.work_orders # @work_orders = @building.work_orders <<<<< What I wanted to work :C
      
        #'/WORK_ORDERS'
        else
    
            @work_orders = WorkOrder.all
        end        
    end

    def status_pending
        # @work_orders = WorkOrder.where(:status => "PENDING")
        @work_orders = WorkOrder.pending_orders
        render :status_pending
    end

        private
            def work_order_params
                params.require(:work_order).permit(:content, :status, :solution, :solve_date, :worker, :staff_member_id, :tenant, :apartment_id, :tenant_id, :building_id)
            end
end 
