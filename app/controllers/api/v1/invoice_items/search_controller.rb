class Api::V1::InvoiceItems::SearchController < ApplicationController
	def index
		if invoice_item_params[:unit_price] != nil
		 	 price = (invoice_item_params[:unit_price].to_f * 100).to_i			
			 render json: InvoiceItemSerializer.new(InvoiceItem.where(unit_price: price))
		else
			render json: InvoiceItemSerializer.new(InvoiceItem.where(invoice_item_params))
		end
	end
	
	def show
		if invoice_item_params[:unit_price] != nil
		 	 price = (invoice_item_params[:unit_price].to_f * 100).to_i			
			 render json: InvoiceItemSerializer.new(InvoiceItem.find_by(unit_price: price))
		else
			render json: InvoiceItemSerializer.new(InvoiceItem.find_by(invoice_item_params))
		end
	end

	private

	def invoice_item_params
		params.permit(:id, :invoice_id, :item_id, :quantity, :unit_price, :updated_at, :created_at)
	end
end

