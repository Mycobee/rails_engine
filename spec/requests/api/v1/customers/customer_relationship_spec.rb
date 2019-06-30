require 'rails_helper'

RSpec.describe 'customer relationships' do
	before :each do
			@customer = create(:customer)	
			@invoice_1 = create(:invoice, customer: @customer)	
			@invoice_2 = create(:invoice, customer: @customer)	
			@invoice_3 = create(:invoice)	
			@transaction_1 = create(:transaction, invoice: @invoice_1)	
			@transaction_2 = create(:transaction, invoice: @invoice_2)	
			@transaction_3 = create(:transaction)	
	end


	it 'invoices' do
			get "/api/v1/customers/#{@customer.id}/invoices"

			expect(response).to be_successful

			invoices = JSON.parse(response.body)["data"]

			expect(invoices.count).to eq(2)
			expect(invoices[0]["id"]).to eq(@invoice_1.id.to_s)
			expect(invoices[1]["id"]).to eq(@invoice_2.id.to_s)
	end

	it 'transactions' do
			get "/api/v1/customers/#{@customer.id}/transactions"

			expect(response).to be_successful

			transactions = JSON.parse(response.body)["data"]

			expect(transactions.count).to eq(2)
			expect(transactions[0]["id"]).to eq(@transaction_1.id.to_s)
			expect(transactions[1]["id"]).to eq(@transaction_2.id.to_s)
	end
end



