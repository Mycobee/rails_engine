class TotalRevenueSerializer
  include FastJsonapi::ObjectSerializer
	attribute :total_revenue do |object|
		(object.total_revenue.to_f / 100).to_s
	end
end
