require 'rails_helper'

RSpec.describe Invoice, type: :model do
	describe 'relationships' do
		it {should belong_to(:customer)}
		it {should belong_to(:merchant)}
		it {should have_many(:invoice_items)}
		it {should have_many(:transactions)}
		it {should have_many(:items).through(:invoice_items)}
	end

	describe 'class methods' do
		it '.random' do
			create_list(:invoice, 3)
			expect(Invoice.random.class).to eq(Invoice)
		end
	end
end
