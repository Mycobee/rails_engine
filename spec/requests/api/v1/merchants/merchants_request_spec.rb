require 'rails_helper'

RSpec.describe 'Merchants API ' do
	it 'sends a list of merchants' do
		create_list(:merchant, 3)

		get '/api/v1/merchants'

		expect(response).to be_successful

		merchants = JSON.parse(response.body)

		expect(Merchant.count).to eq(3)
	end

	it 'can get a merchant by id' do 
		id = create(:merchant).id

		get "/api/v1/merchants/#{id}"

		merchant = JSON.parse(response.body)

		expect(response).to be_successful
		expect(merchant["data"]["attributes"]["id"]).to eq(id)
	end
end
