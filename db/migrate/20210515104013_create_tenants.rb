class CreateTenants < ActiveRecord::Migration[6.1]
  def change
    create_table :tenants do |t|
      t.references :property, null: false, foreign_key: true
      t.string :name
      t.string :external_id
      t.string :tenant_type
      t.string :floor
      t.decimal :leasable_area
      t.datetime :lease_commenced_on
      t.decimal :base_rent

      t.timestamps default: -> { 'CURRENT_TIMESTAMP' }
    end

    add_index :tenants, :external_id, unique: true
  end
end
