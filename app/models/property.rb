require 'csv'
class Property < ApplicationRecord
  include Importable
  has_many :tenants, dependent: :destroy
  validates :external_id, uniqueness: true, presence: true
end
