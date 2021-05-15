class CreateProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :properties do |t|
      t.string :name
      t.string :external_id
      t.string :property_type
      t.string :city
      t.string :country
      t.decimal :price, desc: "Acquisition Price"
      t.decimal :leasable_area
      t.datetime :acquired_on

      t.timestamps default: -> { 'CURRENT_TIMESTAMP' }
    end

    add_index :properties, :external_id, unique: true
  end
end