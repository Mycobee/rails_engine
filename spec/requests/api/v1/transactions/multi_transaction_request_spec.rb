require 'rails_helper'

describe 'Search Controller' do
	before :each do
		@invoice_1 = create(:invoice)
		@transaction_1 = create(:transaction, created_at: '2019-06-23 14:53:59 UTC', updated_at: '2019-06-23 14:53:59 UTC', invoice: @invoice_1)
		@transaction_2 = create(:transaction, created_at: '2019-06-23 14:53:59 UTC', updated_at: '2019-06-23 14:53:59 UTC', invoice: @invoice_1)
  end	

	it 'finds all transaction by created_at' do
		get "/api/v1/transactions/find_all?created_at=2019-06-23-14:53:59-UTC"

		expect(response).to be_successful

		transaction = JSON.parse(response.body)
		expect(transaction["data"].count).to eq(2)
		expect(transaction["data"].class).to eq(Array)
	end

	it 'finds all transaction by updated_at' do
		get "/api/v1/transactions/find_all?updated_at=2019-06-23-14:53:59-UTC"

		expect(response).to be_successful

		transaction = JSON.parse(response.body)

		expect(transaction["data"].count).to eq(2)
		expect(transaction["data"].class).to eq(Array)
	end

	it 'finds all transaction by description' do
		get "/api/v1/transactions/find_all?description=#{@transaction_1.description}"

		expect(response).to be_successful

		transaction = JSON.parse(response.body)
	  	
		expect(transaction["data"].count).to eq(1)
		expect(transaction["data"].class).to eq(Array)
	end

	it 'finds all transaction by invoice_id' do
		get "/api/v1/transactions/find_all?invoice_id=#{@transaction_1.invoice_id}"


		expect(response).to be_successful

		transaction = JSON.parse(response.body)
	  	
		expect(transaction["data"].count).to eq(2)
		expect(transaction["data"].class).to eq(Array)
	end

	it 'finds all transaction by id' do
		get "/api/v1/transactions/find_all?id=#{@transaction_1.id}"

		expect(response).to be_successful

		transaction = JSON.parse(response.body)

		expect(transaction["data"].class).to eq(Array)
		expect(transaction["data"].count).to eq(1)
	end

	it 'finds all transaction by result' do
		get "/api/v1/transactions/find_all?result=#{@transaction_1.result}"

		expect(response).to be_successful

		transaction = JSON.parse(response.body)

		expect(transaction["data"].class).to eq(Array)
		expect(transaction["data"].count).to eq(2)
	end
	
	it 'finds all transaction by credit_card_number' do
		get "/api/v1/transactions/find_all?credit_card_number=#{@transaction_1.credit_card_number}"

		expect(response).to be_successful

		transaction = JSON.parse(response.body)

		expect(transaction["data"].class).to eq(Array)
		expect(transaction["data"].count).to eq(1)
	end
end
