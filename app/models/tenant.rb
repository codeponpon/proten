class Tenant < ApplicationRecord
  include Importable
  belongs_to :property
end
