class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice
	default_scope { order(:id) }

	def self.random
			rand_id = InvoiceItem.all.pluck(:id).sample
			InvoiceItem.find(rand_id)
	end
end
