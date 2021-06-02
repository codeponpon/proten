require 'csv'

module Importable
  extend ActiveSupport::Concern

  included do
    def self.import_data(file)
      klass = self.name
      data = data_builder(file, klass)

      case klass
      when "Property"
        Property.upsert_all(data, unique_by: :external_id)
      when "Tenant"
        Tenant.upsert_all(data, unique_by: :external_id)
      end
    end
  end

  class_methods do
    def data_builder(file, model)
      data = []
      properties = PropertiesQuery.new
      CSV.foreach(file.path, headers: true) do |row|
        data << if model.eql?('Property') 
          property_data(row) 
        else
          property = properties.find_by(external_id: row[2])
          next if property.blank?
          tenant_data(row, property)
        end
      end
      data
    end

    private

    def property_data(row)
      {
        name:          row[0],
        external_id:   row[1],
        property_type: row[2],
        city:          row[3],
        country:       row[4],
        price:         row[5],
        leasable_area: row[6],
        acquired_on:   DateTime.strptime(row[7], '%m/%d/%Y'),
      }
    end

    def tenant_data(row, property)
      {
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
  end
end