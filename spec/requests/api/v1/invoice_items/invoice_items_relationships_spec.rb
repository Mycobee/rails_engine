require 'rails_helper'

RSpec.describe 'invoice_item relationships' do
	before :each do
			@item_1 = create(:item)	
			@invoice_1 = create(:invoice)	
			@invoice_item_1 = create(:invoice_item, item: @item_1, invoice: @invoice_1)	
	end

	it 'item' do
			get "/api/v1/invoice_items/#{@invoice_item_1.id}/item"

			expect(response).to be_successful

			item = JSON.parse(response.body)["data"]

			expect(item["data"]["id"]).to eq(@item_1.id.to_s)
	end

	it 'invoice' do
			get "/api/v1/invoice_items/#{@invoice_item_1.id}/invoice"

			expect(response).to be_successful

			invoice = JSON.parse(response.body)

			expect(invoice["data"]["id"]).to eq(@invoice_1.id.to_s)
	end
end



