class Transaction < ApplicationRecord
  belongs_to :invoice
	default_scope { order(:id) }
	
	scope :successful, -> { where('result = ?', 'success') }
	
	def self.random
			rand_id = Transaction.all.pluck(:id).sample
			Transaction.find(rand_id)
	end
end
