require 'rails_helper'

describe 'Search Controller' do
	before :each do
		@customer_1 = create(:customer, created_at: '2019-06-23 14:53:59 UTC', updated_at: '2019-06-23 14:53:59 UTC')
		@customer_2 = create(:customer, created_at: 1.days.ago, updated_at: 1.days.ago)
  end	

	it 'finds a customer by created_at' do
		get "/api/v1/customers/find?created_at=2019-06-23-14:53:59-UTC"

		expect(response).to be_successful

		customer = JSON.parse(response.body)

		expect(customer["data"]["attributes"]["id"]).to eq(@customer_1.id)
		expect(customer["data"]["attributes"]["last_name"]).to eq(@customer_1.last_name)
	end

	it 'finds a customer by updated_at' do
		get "/api/v1/customers/find?updated_at=2019-06-23-14:53:59-UTC"

		expect(response).to be_successful

		customer = JSON.parse(response.body)

		expect(customer["data"]["attributes"]["id"]).to eq(@customer_1.id)
		expect(customer["data"]["attributes"]["last_name"]).to eq(@customer_1.last_name)
	end

	it 'finds a customer by name' do
		get "/api/v1/customers/find?last_name=#{@customer_1.last_name}"

		expect(response).to be_successful

		customer = JSON.parse(response.body)

		expect(customer["data"]["attributes"]["id"]).to eq(@customer_1.id)
		expect(customer["data"]["attributes"]["last_name"]).to eq(@customer_1.last_name)
	end

	it 'finds a customer by id' do
		get "/api/v1/customers/find?id=#{@customer_1.id}"

		expect(response).to be_successful

		customer = JSON.parse(response.body)

		expect(customer["data"]["attributes"]["id"]).to eq(@customer_1.id)
		expect(customer["data"]["attributes"]["last_name"]).to eq(@customer_1.last_name)
	end

	it 'finds a random customer' do
		create_list(:customer, 3)

		get '/api/v1/customers/random'

		expect(response).to be_successful

		customer = JSON.parse(response.body)
		expect(customer["data"]["attributes"]).to have_key("id")
		expect(customer["data"]["attributes"]).to have_key("last_name")
	end
end
