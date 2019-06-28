class Merchant < ApplicationRecord
		has_many :items
		has_many :invoices
		has_many :customers, through: :invoices

		def merchant_revenue
			rev = items.joins(invoices: :transactions)
					.where('transactions.result = ?', 'success')
					.select('SUM(invoice_items.unit_price * invoice_items.quantity) AS total_revenue')
			rev[0].total_revenue
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
						 date = date.slice(0..9)
						 joins('INNER JOIN items ON items.merchant_id = merchants.id INNER JOIN invoice_items ON invoice_items.item_id = items.id INNER JOIN invoices ON invoices.id = invoice_items.invoice_id INNER JOIN transactions ON transactions.invoice_id = invoices.id').select('SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue').where('transactions.result = ?', 'success').where('transactions.created_at::date = date ?', date)[0].revenue
		end
end
