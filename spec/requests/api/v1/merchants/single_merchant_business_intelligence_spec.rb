require 'rails_helper'

RSpec.describe 'single merchant business intelligence' do
	before :each do
		@merchant_4 = create(:merchant)

		@customer_3 = create(:customer)
		@customer_4 = create(:customer)
		
		@invoice_4a = create(:invoice, merchant: @merchant_4, customer: @customer_3, created_at: 4.days.ago)
		@item_4a = create(:item, merchant: @merchant_4, created_at: 4.days.ago)
		@invoice_item_4a = create(:invoice_item, item: @item_4a, invoice: @invoice_4a, created_at: 4.days.ago)
		@transaction_4a = create(:transaction, invoice: @invoice_4a, created_at: 4.days.ago)

		@invoice_4b = create(:invoice, merchant: @merchant_4, customer: @customer_4, created_at: 4.days.ago)
		@item_4b = create(:item, merchant: @merchant_4, created_at: 4.days.ago)
		@invoice_item_4b = create(:invoice_item, item: @item_4b, invoice: @invoice_4b, created_at: 4.days.ago)
		@transaction_4b = create(:transaction, invoice: @invoice_4b, created_at: 4.days.ago)

		@invoice_4c	= create(:invoice, merchant: @merchant_4, customer: @customer_4, created_at: 4.days.ago)
		@item_4c = create(:item, merchant: @merchant_4, created_at: 4.days.ago)
		@invoice_item_4c = create(:invoice_item, item: @item_4c, invoice: @invoice_4c, created_at: 4.days.ago)
		@transaction_4c = create(:transaction, invoice: @invoice_4c, created_at: 4.days.ago)

		@invoice_4d	= create(:invoice, merchant: @merchant_4, customer: @customer_4, created_at: 4.days.ago)
		@item_4d = create(:item, merchant: @merchant_4, created_at: 4.days.ago)
		@invoice_item_4d = create(:invoice_item, item: @item_4d, invoice: @invoice_4d, created_at: 4.days.ago)
		@transaction_4d = create(:transaction, invoice: @invoice_4d, created_at: 4.days.ago)
		@expected_revenue = ((@invoice_item_4a.unit_price * @invoice_item_4a.quantity) + (@invoice_item_4b.unit_price * @invoice_item_4b.quantity) + (@invoice_item_4c.unit_price * @invoice_item_4c.quantity) + (@invoice_item_4d.unit_price * @invoice_item_4d.quantity)) / 100
	
		@revenue_by_date = (@invoice_item_4d.quantity * @invoice_item_4d.unit_price) / 100
	end

	it 'revenue' do
		get "/api/v1/merchants/#{@merchant_4.id}/revenue"
		
		expect(response).to be_successful
		revenue = JSON.parse(response.body)["data"]
		expect(revenue["data"]["attributes"]["total_revenue"]).to eq(@expected_revenue.to_s)
	end

	it 'revenue?date' do
		get "/api/v1/merchants/#{@merchant_4.id}/revenue"

		expect(response).to be_successful
		revenue = JSON.parse(response.body)["data"]
		expect(revenue["data"]["attributes"]["total_revenue"]).to eq(@revenue_by_date.to_s)
	end

	it 'favorite_custy' do
		get "/api/v1/merchants/#{@merchant_4.id}/favorite_customer"

		expect(response).to be_successful
		revenue = JSON.parse(response.body)["data"]
		expect(revenue["data"]["attributes"]["id"]).to eq(@customer_4.id.to_s)
	end
end
