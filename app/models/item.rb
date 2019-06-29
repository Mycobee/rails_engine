class Item < ApplicationRecord
  belongs_to :merchant
	has_many :invoice_items
	has_many :invoices, through: :invoice_items


	def self.most_revenue(quantity)
		 			 joins(invoices: :transactions)
					.select('SUM(invoice_items.quantity * invoice_items.unit_price) AS item_revenue, items.*')
					.group(:id)
					.order('item_revenue DESC')
					.limit(quantity)
	end

	def self.most_items(quantity)
		 			 joins(invoices: :transactions)
					.select('SUM(invoice_items.quantity) AS item_count, items.*')
					.group(:id)
					.order('item_count DESC')
					.limit(quantity)
	end
end
