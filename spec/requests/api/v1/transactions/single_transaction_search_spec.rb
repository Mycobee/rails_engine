require 'rails_helper'

describe 'Search Controller' do
	before :each do
		@transaction_1 = create(:transaction, created_at: '2019-06-23 14:53:59 UTC', updated_at: '2019-06-23 14:53:59 UTC')
		@transaction_2 = create(:transaction, created_at: 1.days.ago, updated_at: 1.days.ago)
  end	

	it 'finds a transaction by created_at' do
		get "/api/v1/transactions/find?created_at=2019-06-23-14:53:59-UTC"

		expect(response).to be_successful

		transaction = JSON.parse(response.body)

		expect(transaction["data"]["attributes"]["id"]).to eq(@transaction_1.id)
	end

	it 'finds a transaction by updated_at' do
		get "/api/v1/transactions/find?updated_at=2019-06-23-14:53:59-UTC"

		expect(response).to be_successful

		transaction = JSON.parse(response.body)

		expect(transaction["data"]["attributes"]["id"]).to eq(@transaction_1.id)
	end


	it 'finds a transaction by id' do
		get "/api/v1/transactions/find?id=#{@transaction_1.id}"

		expect(response).to be_successful

		transaction = JSON.parse(response.body)

		expect(transaction["data"]["attributes"]["id"]).to eq(@transaction_1.id)
	end

	it 'finds a random transaction' do
		create_list(:transaction, 3)

		get '/api/v1/transactions/random'

		expect(response).to be_successful

		transaction = JSON.parse(response.body)
		expect(transaction["data"]["attributes"]).to have_key("id")
	end
end

