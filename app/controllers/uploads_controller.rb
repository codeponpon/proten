class UploadsController < ApplicationController
  skip_before_action :authenticate_account!
  skip_before_action :set_sentry_user

  def index
  end

  def upload
    prop = params[:prop]
    tenn = params[:tenn]

    if prop.present?
      Property.import_data(prop)
    end

    if tenn.present?
      Tenant.import_data(tenn)
    end

    redirect_to properties_url, notice: "Data Imported"
  end
end