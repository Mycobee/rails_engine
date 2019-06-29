require 'rails_helper'

describe 'Search Controller' do
	before :each do
		@invoice_1 = create(:invoice, created_at: '2019-06-23 14:53:59 UTC', updated_at: '2019-06-23 14:53:59 UTC')
		@invoice_2 = create(:invoice, created_at: 1.days.ago, updated_at: 1.days.ago)
  end	

	it 'finds a invoice by created_at' do
		get "/api/v1/invoices/find?created_at=2019-06-23-14:53:59-UTC"

		expect(response).to be_successful

		invoice = JSON.parse(response.body)

		expect(invoice["data"]["attributes"]["id"]).to eq(@invoice_1.id)
	end

	it 'finds a invoice by updated_at' do
		get "/api/v1/invoices/find?updated_at=2019-06-23-14:53:59-UTC"

		expect(response).to be_successful

		invoice = JSON.parse(response.body)

		expect(invoice["data"]["attributes"]["id"]).to eq(@invoice_1.id)
	end


	it 'finds a invoice by id' do
		get "/api/v1/invoices/find?id=#{@invoice_1.id}"

		expect(response).to be_successful

		invoice = JSON.parse(response.body)

		expect(invoice["data"]["attributes"]["id"]).to eq(@invoice_1.id)
	end

	it 'finds a random invoice' do
		create_list(:invoice, 3)

		get '/api/v1/invoices/random'

		expect(response).to be_successful

		invoice = JSON.parse(response.body)
		expect(invoice["data"]["attributes"]).to have_key("id")
	end
end


