# frozen_string_literal: true

class PropertyDecorator < ApplicationDecorator
  def acquisition_price
    ApplicationController.helpers.number_to_currency wrapped.price
  end

  def leasable_area
    ApplicationController.helpers.number_to_human(wrapped.leasable_area, 
                                                  units: {unit: "m2"}, 
                                                  delimiter: ',', 
                                                  separator: '.')
  end

  def acquired_on
    wrapped.acquired_on.strftime("%b %d, %Y")
  end

  def leased_area
    ApplicationController.helpers.number_to_human(wrapped.tenants.sum(:leasable_area), 
                                                  units: {unit: "m2"}, 
                                                  delimiter: ',')
  end

  def occupancy_rate
    percentage = (wrapped.tenants.sum(:leasable_area) * 100) / wrapped.leasable_area
    ApplicationController.helpers.number_to_percentage(percentage, precision: 2)
  end

  def total_monthly_rent
    ApplicationController.helpers.number_to_currency(wrapped.tenants.sum(:base_rent))
  end

  def monthly_rent
    ApplicationController.helpers.number_to_currency(wrapped.tenants.sum(:base_rent))
  end
end
