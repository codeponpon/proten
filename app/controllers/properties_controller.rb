class PropertiesController < ApplicationController
  skip_before_action :authenticate_account!
  skip_before_action :set_sentry_user

  before_action :property, only: [:show, :edit, :destroy]

  def index
    @properties = Property.all
  end

  def create
    @property = Property.new
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

  def property
    @property ||= Property.find(params[:id])
  end
end
