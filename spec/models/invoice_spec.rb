require 'rails_helper'

RSpec.describe Invoice, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

	describe 'relationships' do
		it {should belong_to :customer)}
		it {should belong_to :merchant)}
	end
end
