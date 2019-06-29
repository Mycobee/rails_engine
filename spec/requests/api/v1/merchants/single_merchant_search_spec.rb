require 'rails_helper'

describe 'Search Controller' do
	it 'finds a merchant by ID' do

	end

	it 'finds a random merchant' do
		create_list(:merchant, 3)

		get '/api/v1/merchants/random'

		expect(response).to be_successful

		merchant = JSON.parse(response.body)
		expect(merchant["data"]["attributes"]).to have_key("id", "name")
	end
end
