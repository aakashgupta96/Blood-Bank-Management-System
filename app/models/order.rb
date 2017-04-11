class Order < ActiveRecord::Base
	belongs_to :bank
	belongs_to :hospital

	enum status: [ :pending, :granted, :rejected ]

end
