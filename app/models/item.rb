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
	
	def self.random
					rand_id = Item.all.pluck(:id).sample
					Item.find(rand_id)
	end

	def best_day
		invoice_items.joins(invoice: :transactions)
					.where('invoice_items.item_id = ?', id)					
					.where('transactions.result = ?', 'success')
					.group('invoices.created_at::date')
					.select('SUM(invoice_items.unit_price * invoice_items.quantity) AS daily_rev, invoices.created_at::date')
					.order('daily_rev DESC')[0].created_at.to_date
	end
end
