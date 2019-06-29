require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
	describe 'relationships' do
		it {should belong_to :item}
		it {should belong_to :invoice}
	end
	
	describe 'class methods' do 
		it '.random' do
			create_list(:invoice_item, 3)
			expect(InvoiceItem.random.class).to eq(InvoiceItem)
		end
	end
end
