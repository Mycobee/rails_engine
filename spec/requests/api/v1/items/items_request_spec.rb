require 'rails_helper'

RSpec.describe 'Items API ' do
	it 'sends a list of items' do
		create_list(:item, 3)

		get '/api/v1/items'

		expect(response).to be_successful

		items = JSON.parse(response.body)

		expect(Item.count).to eq(3)
	end

	it 'can get a item by id' do 
		id = create(:item).id

		get "/api/v1/items/#{id}"

		item = JSON.parse(response.body)

		expect(response).to be_successful
		expect(item["data"]["attributes"]["id"]).to eq(id)
	end
end

