class Activity < ActiveRecord::Base

	validate :name, :presence => true

end
