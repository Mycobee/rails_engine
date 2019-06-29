FactoryBot.define do
  factory :item do
    sequence(:name) { |n| "item_#{n}" }
    sequence(:description) { |n| "description_#{n}" }
		sequence(:unit_price) { |n| n }
    merchant 
  end
end
