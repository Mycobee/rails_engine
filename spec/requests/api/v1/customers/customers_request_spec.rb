require 'rails_helper'

RSpec.describe 'Customers API' do
	it 'sends a list of customers' do
		create_list(:customer, 3)

		get '/api/v1/customers'

		expect(response).to be_successful

		customers = JSON.parse(response.body)

		expect(Customer.count).to eq(3)
	end

	it 'can get a customer by id' do 
		id = create(:customer).id

		get "/api/v1/customers/#{id}"

		customer = JSON.parse(response.body)

		expect(response).to be_successful
		expect(customer["data"]["attributes"]["id"]).to eq(id)
	end
end

