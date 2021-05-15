class Tenant < ApplicationRecord
  belongs_to :property

  def self.import(file)
    tenants = []
    CSV.foreach(file.path, headers: true) do |row|
      property = Property.find_by(external_id: row[2])
      next if property.blank?

      tenants << {
        name:          row[0],
        external_id:   row[1],
        property_id:   property.id,
        tenant_type:   row[3],
        floor:         row[4],
        leasable_area: row[5],
        lease_commenced_on: DateTime.strptime(row[6], '%m/%d/%Y'),
        base_rent:     row[7],
      }
    end
    
    Tenant.upsert_all(tenants, unique_by: :external_id)
  end
end
