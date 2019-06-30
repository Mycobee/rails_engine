require 'rails_helper'

RSpec.describe 'invoice relationships' do
	before :each do
			@merchant = create(:merchant)
			@customer = create(:customer)
			@invoice_1 = create(:invoice, customer: @customer, merchant: @merchant)	
			@invoice_2 = create(:invoice)	
			@transaction_1 = create(:transaction, invoice: @invoice_1)	
			@transaction_2 = create(:transaction, invoice: @invoice_1)	
			@item_1 = create(:item)
			@item_2 = create(:item)
			@item_3 = create(:item)
			@invoice_item_1 = create(:invoice_item, invoice: @invoice_1, item: @item_1)	
			@invoice_item_2 = create(:invoice_item, invoice: @invoice_1, item: @item_2)	
	end


	it 'transactions' do
			get "/api/v1/invoices/#{@invoice_1.id}/transactions"

			expect(response).to be_successful

			transactions = JSON.parse(response.body)["data"]

			expect(transactions[0]["id"]).to eq(@transaction_1.id.to_s)
			expect(transactions[1]["id"]).to eq(@transaction_2.id.to_s)
	end

	it 'invoice_items' do
			get "/api/v1/invoices/#{@invoice_1.id}/invoice_items"

			expect(response).to be_successful

			invoice_items = JSON.parse(response.body)["data"]

			expect(invoice_items[0]["id"]).to eq(@invoice_item_1.id.to_s)
			expect(invoice_items[1]["id"]).to eq(@invoice_item_2.id.to_s)
	end

	it 'items' do
			get "/api/v1/invoices/#{@invoice_1.id}/items"

			expect(response).to be_successful

			items = JSON.parse(response.body)["data"]

			expect(items[0]["id"]).to eq(@item_1.id.to_s)
			expect(items[1]["id"]).to eq(@item_2.id.to_s)
	end
	
	it 'merchant' do
			get "/api/v1/invoices/#{@invoice_1.id}/merchant"

			expect(response).to be_successful

			merchant = JSON.parse(response.body)

			expect(merchant["data"]["id"]).to eq(@merchant.id.to_s)
	end

	it 'customer' do
			get "/api/v1/invoices/#{@invoice_1.id}/customer"

			expect(response).to be_successful

			customer = JSON.parse(response.body)

			expect(customer["data"]["id"]).to eq(@customer.id.to_s)
	end
end





