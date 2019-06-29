class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :merchant
	has_many :transactions
	has_many :invoice_items
	has_many :items, through: :invoice_items

	def self.random
			rand_id = Invoice.all.pluck(:id).sample
			Invoice.find(rand_id)
	end
end
