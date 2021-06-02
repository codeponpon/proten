class PropertiesController < ApplicationController
  skip_before_action :authenticate_account!
  skip_before_action :set_sentry_user

  before_action :property, only: [:show]

  def index
    @properties = PropertyDecorator.decorate_collection(Property.all)
  end

  def show
  end

  private

  def property
    @property ||= properties.find(params[:id])
    @property_decorated ||= PropertyDecorator.new(@property)
  end

  def properties
    @properties ||= PropertiesQuery.new
  end
end
