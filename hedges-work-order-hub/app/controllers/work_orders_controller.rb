class WorkOrdersController < ApplicationController

    def new
        @work_order = WorkOrder.new
        @apt_toggle = ""
        if params[:apartment_id]
            @apt_toggle = params[:apartment_id]
        end
        render :new
    end

    def create

        
        @work_order = WorkOrder.new(work_order_params)
        @work_order.staff_member_id = current_staff_member.id.to_i
    
        if @work_order.save
            redirect_to apartment_work_order_path(@work_order.tenant.apartment, @work_order)
        else
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
                params.require(:work_order).permit(:content, :status, :solution, :solve_date, :worker, :staff_member_id, :tenant, :apartment_id, :tenant_id)
            end
end 
