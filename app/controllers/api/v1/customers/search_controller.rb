class Api::V1::Customers::SearchController < ApplicationController
	def show
		render json: CustomerSerializer.new(Customer.find_by(customer_params))
	end

	private

	def customer_params
		params.permit(:id, :first_name, :last_name, :updated_at, :created_at)
	end
end
