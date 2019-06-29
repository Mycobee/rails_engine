class Transaction < ApplicationRecord
  belongs_to :invoice
	
	scope :successful, -> { where(result: "success") }
	
	def self.random
			rand_id = Transaction.all.pluck(:id).sample
			Transaction.find(rand_id)
	end
end
