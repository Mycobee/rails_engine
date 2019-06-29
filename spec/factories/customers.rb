FactoryBot.define do
  factory :customer do
    first_name { "User" }
    sequence(:last_name) {|n| "Name_#{n}" }
  end
end
