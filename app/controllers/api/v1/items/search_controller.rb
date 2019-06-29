class Api::V1::Items::SearchController < ApplicationController
	def show
		render json: ItemSerializer.new(Item.find_by(item_params))
	end

	private

	def item_params
		params.permit(:id, :name, :updated_at, :created_at)
	end
end

