require 'rails_helper'

describe 'Search Controller' do
	before :each do
		@customer_1 = create(:customer, created_at: '2019-06-23 14:53:59 UTC', updated_at: '2019-06-23 14:53:59 UTC')
		@customer_2 = create(:customer, created_at: '2019-06-23 14:53:59 UTC', updated_at: '2019-06-23 14:53:59 UTC')
  end	

	it 'finds all customer by created_at' do
		get "/api/v1/customers/find_all?created_at=2019-06-23-14:53:59-UTC"

		expect(response).to be_successful

		customer = JSON.parse(response.body)
		expect(customer["data"].count).to eq(2)
		expect(customer["data"].class).to eq(Array)
	end

	it 'finds all customer by updated_at' do
		get "/api/v1/customers/find_all?updated_at=2019-06-23-14:53:59-UTC"

		expect(response).to be_successful

		customer = JSON.parse(response.body)

		expect(customer["data"].count).to eq(2)
		expect(customer["data"].class).to eq(Array)
	end

	it 'finds all customer by last name' do
		get "/api/v1/customers/find_all?last_name=#{@customer_1.last_name}"

		expect(response).to be_successful

		customer = JSON.parse(response.body)
	  	
		expect(customer["data"].count).to eq(1)
		expect(customer["data"].class).to eq(Array)
	end

	it 'finds all customer by first name' do
		get "/api/v1/customers/find_all?first_name=#{@customer_1.first_name}"

		expect(response).to be_successful

		customer = JSON.parse(response.body)
	  	
		expect(customer["data"].count).to eq(2)
		expect(customer["data"].class).to eq(Array)
	end

	it 'finds all customer by id' do
		get "/api/v1/customers/find_all?id=#{@customer_1.id}"

		expect(response).to be_successful

		customer = JSON.parse(response.body)

		expect(customer["data"].class).to eq(Array)
		expect(customer["data"].count).to eq(1)
	end
end
