require 'rails_helper'

describe 'Search Controller' do
	before :each do
		@merchant_1 = create(:merchant, created_at: '2019-06-23 14:53:59 UTC', updated_at: '2019-06-23 14:53:59 UTC')
		@merchant_2 = create(:merchant, created_at: '2019-06-23 14:53:59 UTC', updated_at: '2019-06-23 14:53:59 UTC')
  end	

	it 'finds all merchants by created_at' do
		get "/api/v1/merchants/find_all?created_at=2019-06-23-14:53:59-UTC"

		expect(response).to be_successful

		merchant = JSON.parse(response.body)
		expect(merchant["data"].count).to eq(2)
		expect(merchant["data"].class).to eq(Array)
	end

	it 'finds all merchants by updated_at' do
		get "/api/v1/merchants/find_all?updated_at=2019-06-23-14:53:59-UTC"

		expect(response).to be_successful

		merchant = JSON.parse(response.body)

		expect(merchant["data"].count).to eq(2)
		expect(merchant["data"].class).to eq(Array)
	end

	it 'finds all merchants by name' do
		get "/api/v1/merchants/find_all?name=#{@merchant_1.name}"


		expect(response).to be_successful

		merchant = JSON.parse(response.body)
	  	
		expect(merchant["data"].count).to eq(1)
		expect(merchant["data"].class).to eq(Array)
	end


	it 'finds all merchant by id' do
		get "/api/v1/merchants/find_all?id=#{@merchant_1.id}"

		expect(response).to be_successful

		merchant = JSON.parse(response.body)

		expect(merchant["data"].class).to eq(Array)
		expect(merchant["data"].count).to eq(1)
	end
end
