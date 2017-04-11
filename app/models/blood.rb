class Blood < ActiveRecord::Base
	belongs_to :donor
	belongs_to :bank
end
