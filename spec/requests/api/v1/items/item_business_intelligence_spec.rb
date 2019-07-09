require 'rails_helper'

RSpec.describe 'items business intelligence' do
		before :each do 
			@merchant_2 = create(:merchant)

			@customer_2 = create(:customer)

	
			@invoice_2a = create(:invoice, merchant: @merchant_2, customer: @customer_2, created_at: 2.day.ago)
			@item_2a = create(:item, merchant: @merchant_2, created_at: 2.day.ago)
			@invoice_item_2a = create(:invoice_item, quantity: 500, unit_price: 50000, item: @item_2a, invoice: @invoice_2a, created_at: 2.day.ago)
			@transaction_2a = create(:transaction, invoice: @invoice_2a, created_at: 2.days.ago)

			@invoice_2b = create(:invoice, merchant: @merchant_2, customer: @customer_2, created_at: 3.days.ago)
			@item_2b = create(:item, merchant: @merchant_2, created_at: 3.days.ago)
			@invoice_item_2b = create(:invoice_item, item: @item_2b, invoice: @invoice_2b, quantity: 100, unit_price: 100000, created_at: 3.days.ago)
			@transaction_2b = create(:transaction, invoice: @invoice_2b, created_at: 3.days.ago)

		end
		
		xit 'most_revenue' do
			get "/api/v1/items/most_revenue?quantity=2"	

			expect(response).to be_successful

			items = JSON.parse(response.body)["data"]
			expect(items.count).to eq(2)
			expect(items[0]["id"]).to eq(@item_2a.id.to_s)
			expect(items[1]["id"]).to eq(@item_2b.id.to_s)
		end

		it '.most_items' do
			get "/api/v1/items/most_items?quantity=2"	

			expect(response).to be_successful

			items = JSON.parse(response.body)["data"]
			expect(items.count).to eq(2)
			expect(items[0]["id"]).to eq(@item_2a.id.to_s)
			expect(items[1]["id"]).to eq(@item_2b.id.to_s)
		end

		it '.best_day' do
			get "/api/v1/items/#{@item_2b.id}/best_day"	

			expect(response).to be_successful

			best_day = JSON.parse(response.body)["data"]
			expect(best_day["attributes"]["best_day"]).to eq(@transaction_2b.created_at.to_s(:db).slice(0..9))
		end
end	
