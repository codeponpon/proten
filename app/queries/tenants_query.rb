class TenantsQuery
  attr_accessor :relation

  def initialize(relation: Tenant.all)
    @relation = relation.includes(:property)
  end

  def find(id)
    response = @relation.select{|pt| pt.id.eql?(id.to_i)}.first
    response || ActiveRecord::RecordNotFound.new("Couldn't find Tenant with 'id'=#{id}")
  end
end