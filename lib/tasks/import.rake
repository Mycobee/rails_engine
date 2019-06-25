require 'csv'

namespace :import do
	task :data => :environment do
		CSV.foreach(/path/to/customers.csv) do |row|
			first_name = row[1]
			last_name = row[2]
			Customer.create(first_name: first_name, last_name: last_name)
		end

		CSV.foreach(/path/to/invoice_items.csv) do |row|
			item_id = row[1]
			invoice_id = row[2]
			quantity = row[3]
			unit_price = row[4]
			InvoiceItem.create(item_id: item_id, invoice_id: invoice_id, quantity: quantity, unit_price:  unit_price)
		end

		CSV.foreach(/path/to/invoices.csv) do |row|
			customer_id = row[1]
			merchant_id = row[2]
			status = row[3]
			Invoice.create(customer_id: customer_id, merchant_id: merchant_id, status: status)
		end
	end
end
