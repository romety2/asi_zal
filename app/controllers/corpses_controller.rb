class CorpsesController < ApplicationController
	def index 
		@corpses = Corpse.all
	end
	
	def new
		@corpse = Corpse.new
	end
	
	def create
		@corpse = Corpse.new(params.require(:corpse).permit(:first_name, :last_name, :pesel, :date_of_birth, :date_of_death))
		if @corpse.save
			redirect_to corpses_path, :notice => "Corpse was saved"
		else
			render "new"
		end
	end
end
