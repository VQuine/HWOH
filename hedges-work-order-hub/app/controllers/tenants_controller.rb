class TenantsController < ApplicationController
  def new
    @tenant = Tenant.new
  end

  def create
    @tenant = Tenant.new(tenant_params)
    @tenant.staff_member_id = current_staff_member.id.to_i
    @tenant.name = "#{params[:tenant][:first_name]} #{params[:tenant][:last_name]}"
  
    if @tenant.save
      redirect_to apartment_path(@tenant.apartment)
    else
      "TENANT #CREATE FAILURE"
      render :new
    end
  end

  def show
    @tenant = Tenant.find_by_id(params[:id])
  end

  def index
    @tenants = Tenant.all
  end

  def edit
    @tenant = Tenant.find_by_id(params[:id])
  end

  def update
    @tenant = Tenant.find_by_id(params[:id])
    @tenant.update(tenant_params)
    if @tenant.save
      redirect_to tenant_path(@tenant)
    else
      render :edit
    end
  end

    private
      def tenant_params
        params.require(:tenant).permit(:first_name, :last_name, :phone, :name, :staff_member_id, :tenant_id, :apartment_id, :building_id)
      end
end