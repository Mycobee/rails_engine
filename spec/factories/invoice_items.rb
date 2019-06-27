FactoryBot.define do
  factory :invoice_item do
    item 
    invoice 
    quantity { 2 }
    sequence(:unit_price) { |n| n }
  end
end
