class Api::V1::Items::SearchController < ApplicationController
	def index
		if item_params[:unit_price] != nil
		 	 price = (item_params[:unit_price].to_f * 100).to_i			
			 render json: ItemSerializer.new(Item.where(unit_price: price))
		else
			render json: ItemSerializer.new(Item.where(item_params))
		end
	end
	
	def show
		if item_params[:unit_price] != nil
		 	 price = (item_params[:unit_price].to_f * 100).to_i			
			 render json: ItemSerializer.new(Item.find_by(unit_price: price))
		else
			render json: ItemSerializer.new(Item.find_by(item_params))
		end
	end

	private

	def item_params
		params.permit(:id, :name, :unit_price, :description, :merchant_id, :updated_at, :created_at)
	end
end

