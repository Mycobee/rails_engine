class Api::V1::Merchants::CustomersController < ApplicationController
	def show
			render json:	CustomerSerializer.new(Merchant.find(params[:id]).favorite_custy)
	end
end


