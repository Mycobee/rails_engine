FactoryBot.define do
  factory :transaction do
    invoice 
    credit_card_number { 1 }
    credit_card_expiration_date { "MyString" }
    result { "MyString" }
  end
end
