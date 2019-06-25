require 'rails_helper'

RSpec.describe 'Merchants API ' do
	it 'sends a list of merchants' do
		create_list(:merchant, 3)

		get 'api/v1/merchants'
	end
end
