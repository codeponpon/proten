# frozen_string_literal: true

class TenantDecorator < ApplicationDecorator
  def base_rent
    ApplicationController.helpers.number_to_currency(wrapped.base_rent)
  end

  def lease_commenced_on
    wrapped.lease_commenced_on.strftime("%b %d, %Y") 
  end

  def leasable_area
    ApplicationController.helpers.number_to_human(wrapped.leasable_area, 
                                                  units: {unit: "m2"}, 
                                                  delimiter: ',')
  end
end
