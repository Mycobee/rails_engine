require 'csv'

namespace :import do
	task :data => :environment do
		CSV.foreach(/path/to/customers.csv) do |row|
			first_name = row[1]
			last_name = row[2]
			Customer.create(first_name: first_name, last_name: last_name)
		end
	end
end
