require 'rails_helper'

RSpec.describe 'merchant relationships' do
	it 'invoices' do
			merchant = create(:merchant)
			invoice_1 = create(:invoice, merchant: merchant)	
			invoice_2 = create(:invoice, merchant: merchant)	
			invoice_3 = create(:invoice)	

			get "/api/v1/merchants/#{merchant.id}/invoices"

			expect(response).to be_successful

			invoices = JSON.parse(response.body)["data"]

			expect(invoices.count).to eq(2)
			expect(invoices[0]["id"]).to eq(invoice_1.id.to_s)
			expect(invoices[1]["id"]).to eq(invoice_2.id.to_s)
	end

	it 'invoices' do
			merchant = create(:merchant)
			item_1 = create(:item, merchant: merchant)	
			item_2 = create(:item, merchant: merchant)	
			item_3 = create(:item)	

			get "/api/v1/merchants/#{merchant.id}/items"

			expect(response).to be_successful

			items = JSON.parse(response.body)["data"]

			expect(items.count).to eq(2)
			expect(items[0]["id"]).to eq(item_1.id.to_s)
			expect(items[1]["id"]).to eq(item_2.id.to_s)
	end
end
