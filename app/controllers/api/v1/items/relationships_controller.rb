class Api::V1::Items::RelationshipsController < ApplicationController
	def index
		render json: InvoiceItemSerializer.new(Item.find(params[:id]).invoice_items)
	end
	
	def show
		render json: MerchantSerializer.new(Item.find(params[:id]).merchant)
	end
end


