require 'rails_helper'

describe 'Search Controller' do
	before :each do
		@invoice_item_1 = create(:invoice_item, created_at: '2019-06-23 14:53:59 UTC', updated_at: '2019-06-23 14:53:59 UTC')
		@invoice_item_2 = create(:invoice_item, created_at: 1.days.ago, updated_at: 1.days.ago)
  end	

	it 'finds a invoice_item by created_at' do
		get "/api/v1/invoice_items/find?created_at=2019-06-23-14:53:59-UTC"

		expect(response).to be_successful

		invoice_item = JSON.parse(response.body)

		expect(invoice_item["data"]["attributes"]["id"]).to eq(@invoice_item_1.id)
	end

	it 'finds a invoice_item by updated_at' do
		get "/api/v1/invoice_items/find?updated_at=2019-06-23-14:53:59-UTC"

		expect(response).to be_successful

		invoice_item = JSON.parse(response.body)

		expect(invoice_item["data"]["attributes"]["id"]).to eq(@invoice_item_1.id)
	end


	it 'finds a invoice_item by id' do
		get "/api/v1/invoice_items/find?id=#{@invoice_item_1.id}"

		expect(response).to be_successful

		invoice_item = JSON.parse(response.body)

		expect(invoice_item["data"]["attributes"]["id"]).to eq(@invoice_item_1.id)
	end

	it 'finds a random invoice_item' do
		create_list(:invoice_item, 3)

		get '/api/v1/invoice_items/random'

		expect(response).to be_successful

		invoice_item = JSON.parse(response.body)
		expect(invoice_item["data"]["attributes"]).to have_key("id")
	end
end

