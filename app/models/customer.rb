class Customer < ApplicationRecord
	has_many :invoices
	has_many :merchants, through: :invoices

	def self.random
			rand_id = Customer.all.pluck(:id).sample
			Customer.find(rand_id)
	end

	def favorite_merchant
		Merchant.joins(invoices: :transactions)
						.where('transactions.result = ? AND invoices.customer_id = ?', 'success', id)
					  .group(:id)
						.select('COUNT(invoices.id) AS purchase_count, merchants.*')
						.order('purchase_count DESC')
						.first	
	end
end
