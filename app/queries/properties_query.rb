class PropertiesQuery
  attr_accessor :relation

  def initialize(relation: Property.all)
    @relation = relation.includes(:tenants)
  end

  def find(id)
    response = @relation.select{|pt| pt.id.eql?(id.to_i)}.first
    response || ActiveRecord::RecordNotFound.new("Couldn't find Property with 'id'=#{id}")
  end
end