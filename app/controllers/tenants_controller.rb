class TenantsController < ApplicationController
  skip_before_action :authenticate_account!
  skip_before_action :set_sentry_user

  before_action :tenant, only: [:show]

  def show
  end

  private

  def tenant
    @tenant ||= Tenant.find(params[:id])
    @tenant_decorate ||= TenantDecorator.new(@tenant)
  end
end
