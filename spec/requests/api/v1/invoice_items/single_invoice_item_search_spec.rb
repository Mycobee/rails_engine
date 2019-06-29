require 'rails_helper'

describe 'Search Controller' do
	before :each do
		@merchant_1 = create(:merchant, created_at: '2019-06-23 14:53:59 UTC', updated_at: '2019-06-23 14:53:59 UTC')
		@merchant_2 = create(:merchant, created_at: 1.days.ago, updated_at: 1.days.ago)
  end	

	it 'finds a merchant by created_at' do
		get "/api/v1/merchants/find?created_at=2019-06-23-14:53:59-UTC"

		expect(response).to be_successful

		merchant = JSON.parse(response.body)

		expect(merchant["data"]["attributes"]["id"]).to eq(@merchant_1.id)
		expect(merchant["data"]["attributes"]["name"]).to eq(@merchant_1.name)
	end

	it 'finds a merchant by updated_at' do
		get "/api/v1/merchants/find?updated_at=2019-06-23-14:53:59-UTC"

		expect(response).to be_successful

		merchant = JSON.parse(response.body)

		expect(merchant["data"]["attributes"]["id"]).to eq(@merchant_1.id)
		expect(merchant["data"]["attributes"]["name"]).to eq(@merchant_1.name)
	end

	it 'finds a merchant by name' do
		get "/api/v1/merchants/find?name=#{@merchant_1.name}"

		expect(response).to be_successful

		merchant = JSON.parse(response.body)

		expect(merchant["data"]["attributes"]["id"]).to eq(@merchant_1.id)
		expect(merchant["data"]["attributes"]["name"]).to eq(@merchant_1.name)
		#do a test here
	end

	it 'finds a merchant by id' do
		get "/api/v1/merchants/find?id=#{@merchant_1.id}"

		expect(response).to be_successful

		merchant = JSON.parse(response.body)

		expect(merchant["data"]["attributes"]["id"]).to eq(@merchant_1.id)
		expect(merchant["data"]["attributes"]["name"]).to eq(@merchant_1.name)
		#do a test here
	end

	it 'finds a random merchant' do
		create_list(:merchant, 3)

		get '/api/v1/merchants/random'

		expect(response).to be_successful

		merchant = JSON.parse(response.body)
		expect(merchant["data"]["attributes"]).to have_key("id")
		expect(merchant["data"]["attributes"]).to have_key("name")
	end
end

