class Corpse < ApplicationRecord
	def self.search(search)
  		where("first_name LIKE ? or last_name LIKE ? or pesel LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%") 
	end
end
