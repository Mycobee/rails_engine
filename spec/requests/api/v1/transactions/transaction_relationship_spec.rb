require 'rails_helper'

RSpec.describe 'customer relationships' do
	before :each do
			@invoice_1 = create(:invoice)	
			@invoice_2 = create(:invoice)	
			@transaction_1 = create(:transaction, invoice: @invoice_1)	
	end


	it 'invoices' do
			get "/api/v1/transactions/#{@transaction_1.id}/invoice"

			expect(response).to be_successful

			invoice = JSON.parse(response.body)

			expect(invoice["data"]["id"]).to eq(@invoice_1.id.to_s)
	end
end




