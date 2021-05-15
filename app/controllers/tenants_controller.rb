class TenantsController < ApplicationController
  skip_before_action :authenticate_account!
  skip_before_action :set_sentry_user

  before_action :tenant, only: [:show, :edit, :destroy]

  def index
    @tenants = Tenant.all
  end

  def create
    @tenant = Tenant.new
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def tenant
    @tenant ||= Tenant.find(params[:id])
  end
end
