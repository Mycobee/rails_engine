require 'rails_helper'

RSpec.describe 'customer relationships' do
	before :each do
			@transaction_1 = create(:transaction, invoice: @invoice_1)	
			@invoice_1 = create(:invoice, customer: @customer)	
			@invoice_2 = create(:invoice, customer: @customer)	
	end


	it 'invoices' do
			get "/api/v1/customers/#{@transaction.id}/invoice"

			expect(response).to be_successful

			invoices = JSON.parse(response.body)

			expect(invoice["data"]["id"]).to eq(@invoice_1.id.to_s)
	end
end




