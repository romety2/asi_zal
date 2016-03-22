class CorpsesController < ApplicationController
	def index 
		if user_signed_in?
			@corpses = Corpse.paginate(:page => params[:page], :per_page => 10)
		else
			redirect_to new_user_session_path, :notice => "This page is only available to logged-in users"
		end
	end
	
	def new
		if user_signed_in?
			@corpse = Corpse.new
		else
			redirect_to new_user_session_path, :notice => "This page is only available to logged-in users"
		end
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
		if user_signed_in?
			@corpse = Corpse.find(params[:id])
		else
			redirect_to new_user_session_path, :notice => "This page is only available to logged-in users"
		end
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
		if user_signed_in?
			@corpse = Corpse.find(params[:id])
			@corpse.destroy
			redirect_to corpses_path, :notice => "Corpse has been deleted"
		else
			redirect_to new_user_session_path, :notice => "This page is only available to logged-in users"
		end
	end

	def show
		if user_signed_in?
			@corpse = Corpse.find(params[:id])
		else
			redirect_to new_user_session_path, :notice => "This page is only available to logged-in users"
		end
	end
end
