class Merchant < ApplicationRecord
		has_many :items
		has_many :invoices
		has_many :customers, through: :invoices


		def merchant_revenue
				 	 items.unscoped.joins(invoices: :transactions)
					.where('transactions.result = ?', 'success')
					.select('SUM(invoice_items.unit_price * invoice_items.quantity) AS total_revenue')[0]
		end

		def daily_revenue(date)
						items.unscoped.joins(invoices: :transactions)
					 .where('transactions.result = ?', 'success')
					 .select('SUM(invoice_items.unit_price * invoice_items.quantity) AS total_revenue')[0]
				   .where('invoices.created_at::date = date ?', date)[0]
		end

		def favorite_custy
			Customer.joins(invoices: :transactions)
							.where('transactions.result = ?', 'success')
							.select('COUNT(transactions.id) AS transactions, customers.*')
							.group(:id)
							.where('invoices.merchant_id = ?', self.id)
							.order('transactions DESC')
							.limit(1)[0]
		end

		def self.random
			rand_id = Merchant.all.pluck(:id).sample
			Merchant.find(rand_id)
		end

		def self.most_revenue(limit)
				     joins('INNER JOIN items ON items.merchant_id = merchants.id INNER JOIN invoice_items ON invoice_items.item_id = items.id INNER JOIN invoices ON invoices.id = invoice_items.invoice_id INNER JOIN transactions ON transactions.invoice_id = invoices.id')
						.select('SUM(invoice_items.quantity * invoice_items.unit_price) AS total_revenue, merchants.*')
						.group('merchants.id')	
						.where('transactions.result = ?', 'success')
						.order('total_revenue DESC')
						.limit(limit)
		end

		def self.most_items(limit)
						 joins('INNER JOIN items ON items.merchant_id = merchants.id INNER JOIN invoice_items ON invoice_items.item_id = items.id INNER JOIN invoices ON invoices.id = invoice_items.invoice_id INNER JOIN transactions ON transactions.invoice_id = invoices.id')
						.select('SUM(invoice_items.quantity) AS total_sold, merchants.*')
						.group(:id)
						.where('transactions.result = ?', 'success')
						.order('total_sold DESC')
						.limit(limit)
		end

		def self.revenue_date(date)
						joins('INNER JOIN items ON items.merchant_id = merchants.id INNER JOIN invoice_items ON invoice_items.item_id = items.id INNER JOIN invoices ON invoices.id = invoice_items.invoice_id INNER JOIN transactions ON transactions.invoice_id = invoices.id').select('SUM(invoice_items.quantity * invoice_items.unit_price) AS total_revenue').where('transactions.result = ?', 'success').where('invoices.created_at::date = date ?', date)[0]
		end
end
