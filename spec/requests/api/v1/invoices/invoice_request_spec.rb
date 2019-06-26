require 'rails_helper'

RSpec.describe 'Invoices API ' do
	it 'sends a list of invoices' do
		create_list(:invoice, 3)

		get '/api/v1/invoices'

		expect(response).to be_successful

		invoices = JSON.parse(response.body)

		expect(Invoice.count).to eq(3)
	end

	xit 'can get a invoice by id' do 
		id = create(:invoice).id

		get "/api/v1/invoices/#{id}"

		invoice = JSON.parse(response.body)

		expect(response).to be_successful
		expect(invoice["data"]["attributes"]["id"]).to eq(id)
	end
end

