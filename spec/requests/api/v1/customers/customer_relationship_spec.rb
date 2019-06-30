require 'rails_helper'

RSpec.describe 'customer relationships' do
	before :each do
			@customer = create(:customer)	
			@invoice_1 = create(:invoice, customer: @customer)	
			@invoice_2 = create(:invoice, customer: @customer)	
			@invoice_3 = create(:invoice)	
			@item_1 = create(:item, customer: @customer)	
			@item_2 = create(:item, customer: @customer)	
			@item_3 = create(:item)	
	end

	it 'items' do
			get "/api/v1/customer/#{@customer.id}/items"

			expect(response).to be_successful

			items = JSON.parse(response.body)["data"]

			expect(items.count).to eq(2)
			expect(items[0]["id"]).to eq(@item_1.id.to_s)
			expect(items[1]["id"]).to eq(@item_2.id.to_s)
	end

	it 'invoices' do
			get "/api/v1/customer/#{@customer.id}/invoices"

			expect(response).to be_successful

			invoices = JSON.parse(response.body)

			expect(invoices.count).to eq(2)
			expect(invoices[0]["id"]).to eq(@invoice_1.id.to_s)
			expect(invoices[1]["id"]).to eq(@invoice_2.id.to_s)
	end
end



