require 'rails_helper'

RSpec.describe 'InvoiceItems API' do
	it 'sends a list of invoice_items' do
		create_list(:invoice_item, 3)

		get '/api/v1/invoice_items'

		expect(response).to be_successful

		invoice_items = JSON.parse(response.body)

		expect(InvoiceItem.count).to eq(3)
	end

	it 'can get a invoice_item by id' do 
		id = create(:invoice_item).id

		get "/api/v1/invoice_items/#{id}"

		invoice_item = JSON.parse(response.body)

		expect(response).to be_successful
		expect(invoice_item["data"]["attributes"]["id"]).to eq(id)
	end
end

