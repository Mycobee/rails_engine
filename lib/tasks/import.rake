require 'csv'

namespace :import do
	task :data => :environment do
		CSV.foreach('data/merchants.csv') do |row|
			name = row[1]
			Merchant.create(name: name)
		end

		CSV.foreach('data/customers.csv') do |row|
			first_name = row[1]
			last_name = row[2]
			Customer.create(first_name: first_name, last_name: last_name)
		end

		CSV.foreach('data/items.csv') do |row|
			name = row[1]
			description = row[2]
			unit_price = row[3].to_i
			merchant_id = row[4].to_i
			Item.create(name: name, description: description, unit_price: unit_price, merchant_id: merchant_id)
		end

		CSV.foreach('data/invoices.csv') do |row|
			customer_id = row[1].to_i
			merchant_id = row[2].to_i
			status = row[3]
			Invoice.create(customer_id: customer_id, merchant_id: merchant_id, status: status)
		end

		CSV.foreach('data/invoice_items.csv') do |row|
			item_id = row[1].to_i
			invoice_id = row[2].to_i
			quantity = row[3].to_i
			unit_price = row[4].to_i
			InvoiceItem.create(item_id: item_id, invoice_id: invoice_id, quantity: quantity, unit_price:  unit_price)
		end

		CSV.foreach('data/transactions.csv') do |row|
			invoice_id = row[1].to_i
			credit_card_number = row[2]
			credit_card_expiration_date = row[3]
			result = row[4]
			Transaction.create(invoice_id: invoice_id, credit_card_number: credit_card_number, credit_card_expiration_date: credit_card_expiration_date, result: result)
		end
	end
end
