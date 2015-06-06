class FinishedController < ApplicationController
	before_action :authenticate_user!
	before_action :set_finished, only: [:show, :destroy]

	def index
		@finished_qs = Quest.finished
	end

	def show
	end

	def edit
	end

	def destroy
		@finished.destroy
		respond_to do |format|
			format.html { redirect_to quests_url, notice: "Finished Quest was successfully destroyed." }
			format.json { head :no_content }
		end
	end
	
	private	
	
	def set_finished
		@finished = Quest.find(params[:id])
	end
	def finished_params
		params.require(:quest).permit(:name, :description, :difficulty, :deadline, :state)
	end
end
