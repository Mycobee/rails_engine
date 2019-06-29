require 'rails_helper'

RSpec.describe Merchant, type: :model do
	 before :each do 
		@merchant_1 = create(:merchant)
		@merchant_2 = create(:merchant)
		@merchant_3 = create(:merchant)
		@merchant_4 = create(:merchant)

		@customer_1 = create(:customer)
		@customer_2 = create(:customer)
		@customer_3 = create(:customer)
		@customer_4 = create(:customer)

		@invoice_1a = create(:invoice, merchant: @merchant_1, customer: @customer_1, created_at: 1.day.ago)
		@item_1a = create(:item, merchant: @merchant_1, created_at: 1.day.ago)
		@invoice_item_1a = create(:invoice_item, item: @item_1a, invoice: @invoice_1a, created_at: 1.day.ago)
		@transaction_1a = create(:transaction, invoice: @invoice_1a, created_at: 1.day.ago)
		
	
		@invoice_2a = create(:invoice, merchant: @merchant_2, customer: @customer_2, created_at: 2.day.ago)
		@item_2a = create(:item, merchant: @merchant_2, created_at: 2.day.ago)
		@invoice_item_2a = create(:invoice_item, item: @item_2a, invoice: @invoice_2a, created_at: 2.day.ago)
		@transaction_2a = create(:transaction, invoice: @invoice_2a, created_at: 2.day.ago)

		@invoice_2b = create(:invoice, merchant: @merchant_2, customer: @customer_2, created_at: 2.days.ago)
		@item_2b = create(:item, merchant: @merchant_2, created_at: 2.days.ago)
		@invoice_item_2b = create(:invoice_item, item: @item_2b, invoice: @invoice_2b, created_at: 2.days.ago)
		@transaction_2b = create(:transaction, invoice: @invoice_2b, created_at: 2.day.ago)


		@invoice_3a = create(:invoice, merchant: @merchant_3, customer: @customer_3, created_at: 3.days.ago)
		@item_3a = create(:item, merchant: @merchant_3, created_at: 3.days.ago)
		@invoice_item_3a = create(:invoice_item, item: @item_3a, invoice: @invoice_3a, created_at: 3.days.ago)
		@transaction_3a = create(:transaction, invoice: @invoice_3a, created_at: 3.days.ago)

		@invoice_3b = create(:invoice, merchant: @merchant_3, customer: @customer_3, created_at: 3.days.ago)
		@item_3b = create(:item, merchant: @merchant_3, created_at: 3.days.ago)
		@invoice_item_3b = create(:invoice_item, item: @item_3b, invoice: @invoice_3b, created_at: 3.days.ago)
		@transaction_3b = create(:transaction, invoice: @invoice_3b, created_at: 3.days.ago)

		@invoice_3c	= create(:invoice, merchant: @merchant_3, customer: @customer_3, created_at: 3.days.ago)
		@item_3c = create(:item, merchant: @merchant_3, created_at: 3.days.ago)
		@invoice_item_3c = create(:invoice_item, item: @item_3c, invoice: @invoice_3c, created_at: 3.days.ago)
		@transaction_3c = create(:transaction, invoice: @invoice_3c, created_at: 3.days.ago)


		@invoice_4a = create(:invoice, merchant: @merchant_4, customer: @customer_4, created_at: 4.days.ago)
		@item_4a = create(:item, merchant: @merchant_4, created_at: 4.days.ago)
		@invoice_item_4a = create(:invoice_item, item: @item_4a, invoice: @invoice_4a, created_at: 4.days.ago)
		@transaction_4a = create(:transaction, invoice: @invoice_4a, created_at: 4.days.ago)

		@invoice_4b = create(:invoice, merchant: @merchant_4, customer: @customer_4, created_at: 4.days.ago)
		@item_4b = create(:item, merchant: @merchant_4, created_at: 4.days.ago)
		@invoice_item_4b = create(:invoice_item, item: @item_4b, invoice: @invoice_4b, created_at: 4.days.ago)
		@transaction_4b = create(:transaction, invoice: @invoice_4b, created_at: 4.days.ago)

		@invoice_4c	= create(:invoice, merchant: @merchant_4, customer: @customer_4, created_at: 4.days.ago)
		@item_4c = create(:item, merchant: @merchant_4, created_at: 4.days.ago)
		@invoice_item_4c = create(:invoice_item, item: @item_4c, invoice: @invoice_4c, created_at: 4.days.ago)
		@transaction_4c = create(:transaction, invoice: @invoice_4c, created_at: 4.days.ago)

		@invoice_4d	= create(:invoice, merchant: @merchant_4, customer: @customer_4, created_at: 4.days.ago)
		@item_4d = create(:item, merchant: @merchant_4, created_at: 4.days.ago)
		@invoice_item_4d = create(:invoice_item, item: @item_4d, invoice: @invoice_4d, created_at: 4.days.ago)
		@transaction_4d = create(:transaction, invoice: @invoice_4d, created_at: 4.days.ago)
	end

	describe 'relationships' do
		it {should have_many :items}
		it {should have_many :invoices}
		it {should have_many(:customers).through(:invoices)}
	end

	describe 'class methods' do 
		it '.most_revenue' do
			expect(Merchant.most_revenue(3)).to eq([@merchant_4, @merchant_3, @merchant_2])	
		end

		it '.most_items' do
			expect(Merchant.most_items(3)).to eq([@merchant_4, @merchant_3, @merchant_2])	
		end

		it '.revenue_date' do
			actual = Merchant.revenue_date(@transaction_4a.created_at.to_s(:db))
			expected = ((@invoice_item_4a.unit_price * 2) + (@invoice_item_4b.unit_price * 2) + (@invoice_item_4c.unit_price * 2) + (@invoice_item_4d.unit_price * 2))
			expect(actual).to eq(expected)
		end

		it '.random' do
			expect(Merchant.random.class).to eq(Merchant)
		end
	end

	describe 'instance methods' do	
		it '#merchant_revenue' do
			expected = ((@invoice_item_4a.unit_price * 2) + (@invoice_item_4b.unit_price * 2) + (@invoice_item_4c.unit_price * 2) + (@invoice_item_4d.unit_price * 2))
			expect(@merchant_4.merchant_revenue).to eq(expected)
		end				

		it '#daily_revenue' do
			expected = ((@invoice_item_4a.unit_price * 2) + (@invoice_item_4b.unit_price * 2) + (@invoice_item_4c.unit_price * 2) + (@invoice_item_4d.unit_price * 2))
			expect(@merchant_4.daily_revenue(@transaction_4a.created_at.to_s(:db))).to eq(expected)
		end				

		it '#favorite_custy' do
			expect(@merchant_4.favorite_custy).to eq(@customer_4)
		end
	end
end

