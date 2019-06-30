require 'rails_helper'

RSpec.describe 'item relationships' do
	before :each do
			@merchant = create(:merchant)
			@item_1 = create(:item, merchant: @merchant)	
			@invoice_item_1 = create(:invoice_item, item: @item_1)	
			@invoice_item_2 = create(:invoice_item, item: @item_1)	
	end

	it 'items' do
			get "/api/v1/items/#{@item_1.id}/invoice_items"

			expect(response).to be_successful

			invoice_items = JSON.parse(response.body)["data"]

			expect(invoice_items.count).to eq(2)
			expect(invoice_items[0]["id"]).to eq(@invoice_item_1.id.to_s)
			expect(invoice_items[1]["id"]).to eq(@invoice_item_2.id.to_s)
	end

	it 'merchant' do
			get "/api/v1/items/#{@item_1.id}/merchant"

			expect(response).to be_successful

			merchant = JSON.parse(response.body)

			expect(merchant["data"]["id"]).to eq(@merchant.id.to_s)
	end
end


