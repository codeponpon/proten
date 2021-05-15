FactoryBot.define do
  factory :tenant do
    property { nil }
    name { "MyString" }
    external_id { "MyString" }
    tenant_type { "MyString" }
    floor { 1 }
    leasable_area { "9.99" }
    lease_commenced_on { "2021-05-15 17:40:13" }
    base_rent { "9.99" }
  end
end
