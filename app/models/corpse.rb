class Corpse < ApplicationRecord
	def self.search(search)
  		where("first_name LIKE ? or last_name LIKE ? or pesel LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%") 
	end

	validates :first_name, :last_name, :pesel, :date_of_birth, :date_of_death, presence: true
	validates :first_name, :last_name, length: { minimum: 3 }
	validates :pesel, length: { is: 11 }, numericality: true
end
