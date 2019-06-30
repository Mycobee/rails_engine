class Api::V1::Merchants::TotalDateController < ApplicationController
	def show
		render json:	RevenueSerializer.new(Merchant.revenue_date(params[:date]))
	end
end
