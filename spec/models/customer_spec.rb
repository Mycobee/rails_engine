require 'rails_helper'

RSpec.describe Customer, type: :model do
	describe 'relationships' do
		it { should have_many :invoices }
		it { should have_many(:merchants).through(:invoices)}
	end

	describe 'instance methods' do
		it '#favorite_merchant' do
			customer = create(:customer)
			merchant_1 = create(:merchant)	
			merchant_2 = create(:merchant)	

			invoice_1a = create(:invoice, merchant: merchant_1, customer: customer)
			invoice_1b = create(:invoice, merchant: merchant_1, customer: customer)
			transaction_1a = create(:transaction, invoice: invoice_1a)
			transaction_1b = create(:transaction, invoice: invoice_1b)

			invoice_2a = create(:invoice, merchant: merchant_2, customer: customer)
			transaction_2a = create(:transaction, invoice: invoice_2a)

			expect(customer.favorite_merchant).to eq(merchant_1)
		end
	end
	
	describe 'class methods' do
		it '.random' do
			create_list(:customer, 3)
			expect(Customer.random.class).to eq(Customer)
		end
	end
end
