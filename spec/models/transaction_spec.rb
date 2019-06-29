require 'rails_helper'

RSpec.describe Transaction, type: :model do
	describe 'relationships' do 
		it { should belong_to :invoice }
	end
	
	describe 'class methods' do
		it '.random' do
			create_list(:transaction, 3)
			expect(Transaction.random.class).to eq(Transaction)
		end
	end
end
