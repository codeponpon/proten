require 'csv'
class Property < ApplicationRecord
  has_many :tenants, dependent: :destroy
  validates :external_id, uniqueness: true, presence: true

  def self.import(file)
    properties = []
    CSV.foreach(file.path, headers: true) do |row|
      properties << {
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

    Property.upsert_all(properties, unique_by: :external_id)
  end
end
