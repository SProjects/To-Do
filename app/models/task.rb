class Task < ActiveRecord::Base

	validate :title, :presence => true
	validate :description, :presence => true

end