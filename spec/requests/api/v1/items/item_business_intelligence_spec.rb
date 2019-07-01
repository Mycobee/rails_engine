require 'rails_helper'

RSpec.describe 'items business intelligence' do
		before :each do 
			@merchant_2 = create(:merchant)

			@customer_2 = create(:customer)

	
			@invoice_2a = create(:invoice, merchant: @merchant_2, customer: @customer_2, created_at: 2.day.ago)
			@item_2a = create(:item, merchant: @merchant_2, created_at: 2.day.ago)
			@invoice_item_2a = create(:invoice_item, quantity: 500000, unit_price: 50000, item: @item_2a, invoice: @invoice_2a, created_at: 2.day.ago)
			@transaction_2a = create(:transaction, invoice: @invoice_2a, created_at: 2.day.ago)

			@invoice_2b = create(:invoice, merchant: @merchant_2, customer: @customer_2, created_at: 3.days.ago)
			@item_2b = create(:item, merchant: @merchant_2, created_at: 2.days.ago)
			@invoice_item_2b = create(:invoice_item, item: @item_2b, invoice: @invoice_2b, quantity: 100000, unit_price: 100000, created_at: 2.days.ago)
			@transaction_2b = create(:transaction, invoice: @invoice_2b, created_at: 2.day.ago)

		end
		
		it 'most_revenue' do
			get "/api/v1/items/most_revenue?quantity=2"	

			expect(response).to be_successful

			items = JSON.parse(response.body)["data"]
			expect(items.count).to eq(2)
			expect(items[0]["id"]).to eq(@item_2b.id.to_s)
			expect(items[1]["id"]).to eq(@item_2c.id.to_s)
		end

		it '.most_items' do
			get "/api/v1/items/most_items?quantity=2"	

			expect(response).to be_successful

			items = JSON.parse(response.body)["data"]
			expect(items.count).to eq(2)
			expect(items[0]["id"]).to eq(@item_2d.id.to_s)
			expect(items[1]["id"]).to eq(@item_2c.id.to_s)
		end

		xit '.best_day' do
			expect(@item_4d.best_day).to eq(4.days.ago.to_date)
		end
end	
