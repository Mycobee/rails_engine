FactoryBot.define do
  factory :transaction do
    invoice 
    sequence(:credit_card_number) { |n| n.to_s.rjust(16, "0") }
    credit_card_expiration_date { "MyString" }
    result { "success" }
  end

  factory :failed_transaction, parent: :transaction do
    result { "failed" }
  end
end
