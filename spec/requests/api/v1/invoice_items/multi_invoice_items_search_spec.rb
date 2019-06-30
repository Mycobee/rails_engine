require 'rails_helper'

describe 'Search Controller' do
	before :each do
		@invoice_1 = create(:invoice)
		@item_1 = create(:item)
		@invoice_item_1 = create(:invoice_item, created_at: '2019-06-23 14:53:59 UTC', updated_at: '2019-06-23 14:53:59 UTC', invoice: @invoice_1, item: @item_1)
		@invoice_item_2 = create(:invoice_item, created_at: '2019-06-23 14:53:59 UTC', updated_at: '2019-06-23 14:53:59 UTC', invoice: @invoice_1, item: @item_1)
  end	

	it 'finds all invoice_item by created_at' do
		get "/api/v1/invoice_items/find_all?created_at=2019-06-23-14:53:59-UTC"

		expect(response).to be_successful

		invoice_item = JSON.parse(response.body)
		expect(invoice_item["data"].count).to eq(2)
		expect(invoice_item["data"].class).to eq(Array)
	end

	it 'finds all invoice_item by updated_at' do
		get "/api/v1/invoice_items/find_all?updated_at=2019-06-23-14:53:59-UTC"

		expect(response).to be_successful

		invoice_item = JSON.parse(response.body)

		expect(invoice_item["data"].count).to eq(2)
		expect(invoice_item["data"].class).to eq(Array)
	end

	it 'finds all invoice_item by invoice_id' do
		get "/api/v1/invoice_items/find_all?invoice_id=#{@invoice_item_1.invoice_id}"


		expect(response).to be_successful

		invoice_item = JSON.parse(response.body)
	  	
		expect(invoice_item["data"].count).to eq(2)
		expect(invoice_item["data"].class).to eq(Array)
	end

	it 'finds all invoice_item by item_id' do
		get "/api/v1/invoice_items/find_all?item_id=#{@invoice_item_1.item_id}"


		expect(response).to be_successful

		invoice_item = JSON.parse(response.body)
	  	
		expect(invoice_item["data"].count).to eq(2)
		expect(invoice_item["data"].class).to eq(Array)
	end

	it 'finds all invoice_item by id' do
		get "/api/v1/invoice_items/find_all?id=#{@invoice_item_1.id}"

		expect(response).to be_successful

		invoice_item = JSON.parse(response.body)

		expect(invoice_item["data"].class).to eq(Array)
		expect(invoice_item["data"].count).to eq(1)
	end

	it 'finds all invoice_item by quantity' do
		get "/api/v1/invoice_items/find_all?quantity=#{@invoice_item_1.quantity}"

		expect(response).to be_successful

		invoice_item = JSON.parse(response.body)

		expect(invoice_item["data"].class).to eq(Array)
		expect(invoice_item["data"].count).to eq(2)
	end
end
