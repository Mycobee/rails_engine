require 'rails_helper'

describe 'Search Controller' do
	before :each do
		@customer_1 = create(:customer)
		@merchant_1 = create(:merchant)
		@invoice_1 = create(:invoice, created_at: '2019-06-23 14:53:59 UTC', updated_at: '2019-06-23 14:53:59 UTC', customer: @customer_1, merchant: @merchant_1)
		@invoice_2 = create(:invoice, created_at: '2019-06-23 14:53:59 UTC', updated_at: '2019-06-23 14:53:59 UTC', customer: @customer_1, merchant: @merchant_1)
  end	

	it 'finds all invoice by created_at' do
		get "/api/v1/invoices/find_all?created_at=2019-06-23-14:53:59-UTC"

		expect(response).to be_successful

		invoice = JSON.parse(response.body)
		expect(invoice["data"].count).to eq(2)
		expect(invoice["data"].class).to eq(Array)
	end

	it 'finds all invoice by updated_at' do
		get "/api/v1/invoices/find_all?updated_at=2019-06-23-14:53:59-UTC"

		expect(response).to be_successful

		invoice = JSON.parse(response.body)

		expect(invoice["data"].count).to eq(2)
		expect(invoice["data"].class).to eq(Array)
	end

	it 'finds all invoice by customer_id' do
		get "/api/v1/invoices/find_all?customer_id=#{@invoice_1.customer_id}"

		expect(response).to be_successful

		invoice = JSON.parse(response.body)
	  	
		expect(invoice["data"].count).to eq(2)
		expect(invoice["data"].class).to eq(Array)
	end

	it 'finds all invoice by merchant_id' do
		get "/api/v1/invoices/find_all?merchant_id=#{@invoice_1.merchant_id}"


		expect(response).to be_successful

		invoice = JSON.parse(response.body)
	  	
		expect(invoice["data"].count).to eq(2)
		expect(invoice["data"].class).to eq(Array)
	end

	it 'finds all invoice by status' do
		get "/api/v1/invoices/find_all?status=#{@invoice_1.status}"


		expect(response).to be_successful

		invoice = JSON.parse(response.body)
	  	
		expect(invoice["data"].count).to eq(2)
		expect(invoice["data"].class).to eq(Array)
	end

	it 'finds all invoice by id' do
		get "/api/v1/invoices/find_all?id=#{@invoice_1.id}"

		expect(response).to be_successful

		invoice = JSON.parse(response.body)

		expect(invoice["data"].class).to eq(Array)
		expect(invoice["data"].count).to eq(1)
	end
end
