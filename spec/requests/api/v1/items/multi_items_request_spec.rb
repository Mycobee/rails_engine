require 'rails_helper'

describe 'Search Controller' do
	before :each do
		@merchant_1 = create(:merchant)
		@item_1 = create(:item, created_at: '2019-06-23 14:53:59 UTC', updated_at: '2019-06-23 14:53:59 UTC', merchant: @merchant_1)
		@item_2 = create(:item, created_at: '2019-06-23 14:53:59 UTC', updated_at: '2019-06-23 14:53:59 UTC', merchant: @merchant_1)
  end	

	it 'finds all item by created_at' do
		get "/api/v1/items/find_all?created_at=2019-06-23-14:53:59-UTC"

		expect(response).to be_successful

		item = JSON.parse(response.body)
		expect(item["data"].count).to eq(2)
		expect(item["data"].class).to eq(Array)
	end

	it 'finds all item by updated_at' do
		get "/api/v1/items/find_all?updated_at=2019-06-23-14:53:59-UTC"

		expect(response).to be_successful

		item = JSON.parse(response.body)

		expect(item["data"].count).to eq(2)
		expect(item["data"].class).to eq(Array)
	end

	it 'finds all item by description' do
		get "/api/v1/items/find_all?description=#{@item_1.description}"

		expect(response).to be_successful

		item = JSON.parse(response.body)
	  	
		expect(item["data"].count).to eq(1)
		expect(item["data"].class).to eq(Array)
	end

	it 'finds all item by merchant_id' do
		get "/api/v1/items/find_all?merchant_id=#{@item_1.merchant_id}"


		expect(response).to be_successful

		item = JSON.parse(response.body)
	  	
		expect(item["data"].count).to eq(2)
		expect(item["data"].class).to eq(Array)
	end

	it 'finds all item by unit_price' do
		get "/api/v1/items/find_all?unit_price=#{@item_1.unit_price}"

		expect(response).to be_successful

		item = JSON.parse(response.body)
	  	
		expect(item["data"].count).to eq(1)
		expect(item["data"].class).to eq(Array)
	end

	it 'finds all item by id' do
		get "/api/v1/items/find_all?id=#{@item_1.id}"

		expect(response).to be_successful

		item = JSON.parse(response.body)

		expect(item["data"].class).to eq(Array)
		expect(item["data"].count).to eq(1)
	end

	it 'finds all item by name' do
		get "/api/v1/items/find_all?name=#{@item_1.name}"

		expect(response).to be_successful

		item = JSON.parse(response.body)

		expect(item["data"].class).to eq(Array)
		expect(item["data"].count).to eq(1)
	end
end
