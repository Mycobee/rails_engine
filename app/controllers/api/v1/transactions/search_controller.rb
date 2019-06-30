class Api::V1::Transactions::SearchController < ApplicationController
	def index
					render json: TransactionSerializer.new(Transaction.where(merchant_params))
	end

	def show
		render json: TransactionSerializer.new(Transaction.find_by(merchant_params))
	end

	private

	def merchant_params
		params.permit(:id, :invoice_id, :result, :credit_card_number, :credit_card_expiration_date, :updated_at, :created_at)
	end
end

