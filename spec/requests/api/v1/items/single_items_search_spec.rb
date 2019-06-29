require 'rails_helper'

describe 'Search Controller' do
	before :each do
		@item_1 = create(:item, created_at: '2019-06-23 14:53:59 UTC', updated_at: '2019-06-23 14:53:59 UTC')
		@item_2 = create(:item, created_at: 1.days.ago, updated_at: 1.days.ago)
  end	

	it 'finds a item by created_at' do
		get "/api/v1/items/find?created_at=2019-06-23-14:53:59-UTC"

		expect(response).to be_successful

		item = JSON.parse(response.body)

		expect(item["data"]["attributes"]["id"]).to eq(@item_1.id)
		expect(item["data"]["attributes"]["name"]).to eq(@item_1.name)
	end

	it 'finds a item by updated_at' do
		get "/api/v1/items/find?updated_at=2019-06-23-14:53:59-UTC"

		expect(response).to be_successful

		item = JSON.parse(response.body)

		expect(item["data"]["attributes"]["id"]).to eq(@item_1.id)
		expect(item["data"]["attributes"]["name"]).to eq(@item_1.name)
	end

	it 'finds a item by name' do
		get "/api/v1/items/find?name=#{@item_1.name}"

		expect(response).to be_successful

		item = JSON.parse(response.body)

		expect(item["data"]["attributes"]["id"]).to eq(@item_1.id)
		expect(item["data"]["attributes"]["name"]).to eq(@item_1.name)
	end

	it 'finds a item by id' do
		get "/api/v1/items/find?id=#{@item_1.id}"

		expect(response).to be_successful

		item = JSON.parse(response.body)

		expect(item["data"]["attributes"]["id"]).to eq(@item_1.id)
		expect(item["data"]["attributes"]["name"]).to eq(@item_1.name)
	end

	it 'finds a random item' do
		create_list(:item, 3)

		get '/api/v1/items/random'

		expect(response).to be_successful

		item = JSON.parse(response.body)
		expect(item["data"]["attributes"]).to have_key("id")
		expect(item["data"]["attributes"]).to have_key("name")
	end
end

