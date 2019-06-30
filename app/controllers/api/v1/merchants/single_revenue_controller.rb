class Api::V1::Merchants::SingleRevenueController < ApplicationController
	def show
		if params["date"] == nil
			render json:	RevenueSerializer.new(Merchant.find(params[:id]).merchant_revenue)
		else
			render json:	RevenueSerializer.new(Merchant.find(params[:id]).daily_revenue(params["date"]))
		end
	end
end

