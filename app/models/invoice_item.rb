class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice

	def self.random
			rand_id = InvoiceItem.all.pluck(:id).sample
			InvoiceItem.find(rand_id)
	end
end
