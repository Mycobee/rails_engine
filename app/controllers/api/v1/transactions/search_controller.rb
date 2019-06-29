class Api::V1::Transactions::SearchController < ApplicationController
	def show
		render json: TransactionSerializer.new(Transaction.find_by(merchant_params))
	end

	private

	def merchant_params
		params.permit(:id, :result, :credit_card_number, :credit_card_expiration_date, :updated_at, :created_at)
	end
end

