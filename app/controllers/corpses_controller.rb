class CorpsesController < ApplicationController
	def index 
		@corpses = Corpse.paginate(:page => params[:page], :per_page => 10)
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

	def edit
		@corpse = Corpse.find(params[:id])
	end
	
	def update
		@corpse = Corpse.find(params[:id])
		if @corpse.update_attributes(params.require(:corpse).permit(:first_name, :last_name, :pesel, :date_of_birth, :date_of_death))
			redirect_to corpses_path, :notice => "Corpse has been updated"
		else
			render "edit"
		end
	end

	def destroy
		@corpse = Corpse.find(params[:id])
		@corpse.destroy
		redirect_to corpses_path, :notice => "Corpse has been deleted"
	end

	def show
		@corpse = Corpse.find(params[:id])
	end
end
