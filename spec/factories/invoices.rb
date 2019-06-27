FactoryBot.define do
  factory :invoice do
		association :merchant, factory: :merchant
		association :customer, factory: :customer
    status { "shipped" }
  end
end
