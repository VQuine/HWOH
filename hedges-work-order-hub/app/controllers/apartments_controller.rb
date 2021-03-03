class ApartmentsController < ApplicationController

    def index
        @apartments = Apartment.all
    end

    def show
        @apartment = Apartment.find_by_id(params[:id])
        @tenants = Tenant.where(:apartment_id => @apartment.id)

        # @work_orders = WorkOrder.where(tenant.apartment.id => @apartment.id)
        @work_orders = @apartment.work_orders
        # @work_orders = Tenant.find(:apartment_id => params)
        # APARTMENTS LOOK THROUGH TENANTS 
        # GRAB ALL THE TENANTS WITH SELFS APTID
        # APARTMENTS LOOK THROUGH WORK ORDERS
        #@work_orders = WorkOrder.where(:tenant_id => @apartment) # WHY THE HECK DOES THIS WORK  !!!!!!!!!!!!!!!!!!!!!!!!
        # @work_orders = Apartment.find(params[:apartment_id].work_orders)
            #BREAKS if NOTHING is found
            # byebug
    end
end